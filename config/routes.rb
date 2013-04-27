Healthystuff::Application.routes.draw do
  devise_for :users

  root to: 'home#index'
  
  resources :groups, only: [:index, :show, :edit]
end
