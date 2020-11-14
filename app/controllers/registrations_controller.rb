class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_in_path_for(:user)
        stored_location_for(:user) || :interest_selection_path
      end
    end
  end