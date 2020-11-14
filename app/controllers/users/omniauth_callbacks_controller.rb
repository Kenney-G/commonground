class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token, only: :github

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
          set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
        else
          session["devise.github_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
 
      def failure
        set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
        redirect_to after_omniauth_failure_path_for(resource_name)
      end
end
