Rails.application.routes.draw do
  root to: "application#home"
devise_for :users, path: 'accounts', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
resources :users
end