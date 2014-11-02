class Schedule
  include HTTParty

  def get_full_schedule

  end

  def self.get_team_schedule team_name
    team_name = team_name.downcase.gsub(' ', '_')
    response = HTTParty.get("http://www.bho.michaelencode.com/team_schedule_#{team_name}.json")

    self.parse_team_schedule response
  end

  private

  def self.parse_team_schedule response
    schedule                  = {}
    schedule[:future_games]   = []
    schedule[:past_games]     = []

    if response.code != 200
      false
    else
      raw_schedule = JSON.parse(response.body)

      raw_schedule.each do |game|
        if Time.zone.parse("#{game['Date']} #{game['Start']}").future?
          schedule[:future_games].push game
        else
          schedule[:past_games].push game
        end
      end
    end

    schedule
  end
end