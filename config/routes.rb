Rails.application.routes.draw do
  root to: "application#home"

devise_for :users, controllers: { omniauth_callbacks: 'users/github_omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
