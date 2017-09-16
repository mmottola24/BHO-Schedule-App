Rails.application.routes.draw do
  devise_for :users
  resources :players
  resources :games
  get 'manage', to: 'manage#index'

  root to: 'visitors#index'

  get 'team/vendetta', to: 'visitors#team_vendetta'
  get 'calendar', to: 'visitors#calendar'
end
