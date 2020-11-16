Rails.application.routes.draw do

  resources :users do
    resources :topics do
     resources :interest_levels
    end
  end

  resources :topics do 
      resources :users do
        resources :interest_levels
  end
end

resources :interest_levels do
    resources :topics do 
      resources :users
  end
end

  root to: "application#home"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end