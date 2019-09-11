module GamesHelper

  def get_active_season team
    team.seasons.first
  end

  def generate_add_game_url game
    query_str = {
        game: {
          date: game['Date'],
          facility: game['Facility'],
          visitor_team: game['Visitor'],
          visitor_points: game['VisitorPts'],
          home_team: game['Home'],
          home_points: game['HomePts'],
          time: game['Start']
        }
    }

    "#{new_game_path}?#{query_str.to_query}"
  end

  # Accepts a string time (example: 6:00 PM)
  # Outputs military time
  def convert_time_to_24_hour time
    new_time = time.to_s
    if new_time.to_s.include? ("PM")
      new_time = new_time.gsub(' PM','')

      segments = new_time.split(':')
      new_time = "#{(segments.first.to_i + 12)}:#{segments.last}"
    end
    new_time
  end

  def show_field label, field
    raw "<p><b>#{label}:</b><br>#{field}</p>"
  end
end
