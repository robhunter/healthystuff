Healthystuff::Application.routes.draw do
  root to: 'home#index'
  
  resources :groups, only: [:index, :show, :edit]
end
