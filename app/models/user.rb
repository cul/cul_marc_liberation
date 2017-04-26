class User < ActiveRecord::Base
  include Cul::Omniauth::Users

  serialize :affils, Array

  before_create :set_personal_info_via_ldap
  after_initialize :set_personal_info_via_ldap

  def to_s
    if first_name
      first_name.to_s + ' ' + last_name.to_s
    else
      login
    end
  end

  def name
    self.to_s
  end

  def set_personal_info_via_ldap
    if uid

      ldap_args = APP_CONFIG['ldap_connection_details'].symbolize_keys!

      raise "LDAP config needs 'host'" unless ldap_args.has_key?(:host)
      raise "LDAP config needs 'port'" unless ldap_args.has_key?(:port)
      raise "LDAP config needs 'base'" unless ldap_args.has_key?(:base)

      entry = Net::LDAP.new({host: ldap_args[:host], port: ldap_args[:port]}).search(base: ldap_args[:base], :filter => Net::LDAP::Filter.eq("uid", uid)) || []
      entry = entry.first

      if entry
        # Copy all attributes of the LDAP entry to an instance variable,
        # keeping them in list format
        @ldap_attributes = Hash.new
        entry.each_attribute do |attribute, value_list|
          next if value_list.blank?
          @ldap_attributes[attribute] = value_list
        end

        # Process certain raw attributes into cleaned up fields
        puts "\n\n#{entry.inspect}\n\n"
        _mail = (entry[:mail].kind_of?(Array) ? entry[:mail].first : entry[:mail]).to_s
        if _mail.length > 6 and _mail.match(/^[\w.]+[@][\w.]+$/)
          self.email = _mail
        else
          self.email = uid + '@columbia.edu'
        end
        self.last_name = (entry[:sn].kind_of?(Array) ? entry[:sn].first : entry[:sn]).to_s
        self.first_name = (entry[:givenname].kind_of?(Array) ? entry[:givenname].first : entry[:givenname]).to_s
      end
    end

    return self
  end


  def login
    self.uid.split('@').first
  end

  def email
    super || "#{login}@columbia.edu"
  end

  # Password methods required by Devise.
  def password
    Devise.friendly_token[0,20]
  end

  def password=(*val)
    # NOOP
  end

  def admin?
    affils && (affils.include?('CUNIX_litosys') || affils.include?('CUL_dpts-dev'))
  end

  # Princeton Auth, below
  # devise :database_authenticatable,
  #        :rememberable, :trackable, :validatable,
  #        :omniauthable
  # 
  # def self.from_cas(access_token)
  #   User.where(provider: access_token.provider, uid: access_token.uid).first_or_create do |user|
  #     user.uid = access_token.uid
  #     user.username = access_token.uid
  #     user.email = "#{access_token.uid}@princeton.edu"
  #     user.password = SecureRandom.urlsafe_base64
  #     user.provider = access_token.provider
  #   end
  # end

end
