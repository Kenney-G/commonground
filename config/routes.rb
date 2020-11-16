Rails.application.routes.draw do
  resources :users do
    resources :interest_levels
    resources :topics, shallow: true
  end
  resources :topics do 
      resources :users, only: [:show, :index] do
      resources :interest_levels
    end
  end
resources :interest_levels do
  resources :users do
    
  end
end

  end
  root to: "application#home"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end