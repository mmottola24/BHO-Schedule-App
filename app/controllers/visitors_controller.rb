class VisitorsController < ApplicationController

  def index
    @vendetta_schedule            = Schedule.get_team_schedule(ENV['TEAM_NAME'])
    #@weekend_warriors_schedule    = Schedule.get_team_schedule('Weekend Warriors')
  end

  def full_team_schedule
    get_team_schedule(ENV['TEAM_NAME'])
  end

  def calendar

  end

  private

  def get_team_schedule team_name
    @data               = {}
    @data[:team_name]   = team_name
    @data[:schedule]    = Schedule.get_team_schedule(team_name)

    respond_to do |format|
      format.html { render 'visitors/team_schedule' }
      format.json {
        render json: Schedule.get_events_calendar_object(@data[:schedule], team_name)
      }
    end
  end
end
