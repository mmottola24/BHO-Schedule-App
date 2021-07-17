class Schedule
  include HTTParty
  require 'time'

  def self.get_full_schedule team_name
    team_name = team_name.downcase.gsub(' ', '_')
    response = HTTParty.get("http://www.bho.michaelencode.com/full_schedule_#{team_name}.json")
    self.parse_team_schedule response
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

  def self.parse_league_schedule response
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

  def self.get_events_calendar_object schedule, team_name
    events = []
    unless schedule[:past_games].blank?
      schedule[:past_games].each do |game|
        result = get_game_result game, team_name
        events.push ({
          id: rand(0..5000),
          title: result,
          allDay: false,
          start: Time.parse("#{game['Date']} #{game['Start']}").iso8601,
          className: game['Home'].downcase == team_name.downcase ? 'home-team' : 'away-team',
        })
      end
    end

    unless schedule[:future_games].blank?
      schedule[:future_games].each do |game|
        events.push ({
          id: rand(0..5000),
          title: 'vs ' + (team_name.downcase == game['Home'].downcase ? game['Visitor'] : game['Home']),
          allDay: false,
          start: Time.parse("#{game['Date']} #{game['Start']}").iso8601,
          className: game['Home'].downcase == team_name.downcase ? 'home-team' : 'away-team'
        })
      end
    end
    events
  end

  def self.get_game_result game, team_name
    if game['HomePts'] == game['VisitorPts']
      result = "T #{game['HomePts']}-#{game['VisitorPts']}\n"
      result << game['Home'].downcase == team_name.downcase ? "vs #{game['Home']}" : "vs #{game['Visitor']}"
    elsif game['Home'].downcase == team_name.downcase
      result = (game['HomePts'] > game['VisitorPts']) ? 'W' : 'L'
      result << " #{game['HomePts']}-#{game['VisitorPts']}\nvs #{game['Visitor']}"
    else
      result = (game['VisitorPts'] > game['HomePts']) ? 'W' : 'L'
      result << " #{game['VisitorPts']}-#{game['HomePts']}\nvs #{game['Home']}"
    end
    result
  end
end