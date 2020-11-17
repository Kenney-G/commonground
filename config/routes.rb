Rails.application.routes.draw do
root to: "application#home"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  new_user_password GET    /users/password/new(.:format)     {controller:"devise/passwords", action:"new"}
  end
  resources :users, only: [:update, :show] do
    resources :topics do
     resources :interests
    end
  end

  resources :topics do 
      resources :users do
        resources :interests
  end
end

resources :interests do
    resources :topics do 
      resources :users
  end
end

end