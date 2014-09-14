Rails.application.routes.draw do
  root to: 'visitors#index'

  get 'team/vendetta', to: 'visitors#team_vendetta'
  get 'team/weekend-warriors', to: 'visitors#team_weekend_warriors'
end
