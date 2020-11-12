Rails.application.routes.draw do
  #change the basic url to be home/index
  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
