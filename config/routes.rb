Rails.application.routes.draw do
  get 'welcome/index'
  root :to => 'welcome#index'
  devise_for :users do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session,
     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  as :user do
    get '/', :to => 'users/users#index'
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

