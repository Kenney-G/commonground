Rails.application.routes.draw do
  get 'welcome/index'
  root :to => 'welcome#index'
  devise_for :users do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session,
     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  
  resources :users
  resources :interests
  resources :topics
end