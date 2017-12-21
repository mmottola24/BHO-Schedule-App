Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :players
  resources :games
  get 'manage', to: 'manage#index'

  root to: 'visitors#index'

  get 'team/schedule', to: 'visitors#full_team_schedule'
  get 'calendar', to: 'visitors#calendar'

  resources :users

end
