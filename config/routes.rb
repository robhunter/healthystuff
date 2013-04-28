Healthystuff::Application.routes.draw do
  devise_for :users

  root to: 'home#index'
  
  resources :groups, only: [:index, :show, :edit]
  match "/me", to: 'users#show'
  match "/auth/foursquare/callback", to: 'users#foursquare'
  match "/users/checkin", to: "users#checkin"
  match "/vote", to: 'home#vote'
  match "/leaderboard", to: 'home#leaderboard'
  mount Api => '/api'
end
