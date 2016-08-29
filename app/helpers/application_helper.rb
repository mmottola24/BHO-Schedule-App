module ApplicationHelper

  def get_game_result game, team_name
    result = ''
    if game['home_points'] == game['visitor_points']
      result = "T #{game['home_points']}-#{game['visitor_points']}"
    elsif game['home_team'] == team_name
      result = (game['home_points'] > game['visitor_points']) ? 'W' : 'L'
      result << " #{game['home_points']}-#{game['visitor_points']}"
    else
      result = (game['visitor_points'] > game['home_points']) ? 'W' : 'L'
      result << " #{game['visitor_points']}-#{game['home_points']}"
    end
  end
end
