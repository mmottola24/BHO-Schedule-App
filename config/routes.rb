Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :players
  resources :games
  get 'manage', to: 'manage#index'

  root to: 'visitors#index'

  get 'team/:permalink/schedule', to: 'visitors#full_team_schedule', as: 'get_team_schedule'
  get 'team/:permalink/calendar', to: 'visitors#calendar', as: 'get_team_calendar'
  get 'team/schedule', to: 'visitors#full_team_schedule', as: 'team_schedule'
  get 'team/calendar', to: 'visitors#calendar', as: 'team_calendar'
  get 'league/schedule', to: 'visitors#league_schedule', as: 'league_schedule'
  get 'league/standings', to: 'visitors#standings', as: 'league_standings'
  get 'league/stats', to: 'visitors#league_stats', as: 'league_stats'
  get 'team/stats', to: 'visitors#team_stats', as: 'team_stats'

  resources :users

end
