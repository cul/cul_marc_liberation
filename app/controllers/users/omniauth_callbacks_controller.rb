# Columbia Authentication
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Cul::Omniauth::Callbacks

  def new_session_path(_scope)
    new_user_session_path # this accomodates Users namespace of the controller
  end

  def affiliations(user, affils)
    return unless user
    user.affils = affils.sort
  end
end

# 
# Princeton Authentication below
# 
# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   def cas
#     @user = User.from_cas(request.env['omniauth.auth'])
#     if @user.persisted?
#       sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
#       set_flash_message(:notice, :success, kind: 'from Princeton Central Authentication '\
#                                                  'Service') if is_navigational_format?
#     else
#       redirect_to request.env['omniauth.origin'], alert: "Unauthorized user"
#     end
#   end
# end