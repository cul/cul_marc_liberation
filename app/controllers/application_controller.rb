class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper Locations::ApplicationHelper
  include ApplicationHelper

  # def after_sign_out_path_for(resource_or_scope)
  #   request.referrer
  # end

  def after_sign_out_path_for(_resource_or_scope)
    cas_opts = YAML.load_file(File.join(Rails.root, 'config', 'cas.yml'))[Rails.env] || {}

    # No CAS.
    return root_path unless cas_opts['host'] && cas_opts['logout_url']

    # Full CAS logout + application logout page looks like this:
    # https://cas.columbia.edu/cas/logout?service=https://helpdesk.cul.columbia.edu/welcome/logout
    cas_logout_url = 'https://' + cas_opts['host'] + cas_opts['logout_url']
    return "#{cas_logout_url}?service=#{root_url}"
  end


  # Columbia Authentication
  include Devise::Controllers::Helpers
  devise_group :user, contains: [:user]

end
