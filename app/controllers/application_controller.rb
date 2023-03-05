class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :find_team

  def authenticate_admin
    redirect_to '/', alert: 'Not authorized.' unless current_user && access_whitelist
  end

  private
  def access_whitelist
    current_user.try(:admin?) || current_user.try(:door_super?)
  end

  def find_team
    team = ENV['TEAM_KEY']

    team = params[:team] unless params[:team].blank?

    @team = Team.find_by_permalink(team).first
    @season = Season.first
  end

  def is_cache_data_empty? data
    response = false

    blacklist = [
      '{}',
      '{"headers":[],"body":[]}',
      '{"player":{"headers":[],"body":[]},"goalie":{"headers":[],"body":[]}}'
    ]

    if data.blank? or blacklist.include? data
      response = true
    end

    response
  end
end
