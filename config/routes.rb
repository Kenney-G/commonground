Rails.application.routes.draw do

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session,
     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
