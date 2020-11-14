Rails.application.routes.draw do
  resources :interest_levels
  resources :topics
  resources :users
  root to: "application#home"

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/user' => "users#index", :as => :user_root
  

end
