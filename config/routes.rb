Rails.application.routes.draw do
root to: "application#home"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

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