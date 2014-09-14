class VisitorsController < ApplicationController

  def index
    @vendetta_schedule            = Schedule.get_team_schedule('Vendetta')
    @weekend_warriors_schedule    = Schedule.get_team_schedule('Weekend Warriors')
  end

  def team_vendetta
    get_team_schedule('Vendetta')
  end

  def team_weekend_warriors
    get_team_schedule('Weekend Warriors')
  end

  private

  def get_team_schedule team_name
    @data               = {}
    @data[:team_name]   = team_name
    @data[:schedule]    = Schedule.get_team_schedule(team_name)

    respond_to do |format|
      format.html { render 'visitors/team_schedule' }
    end
  end
end
