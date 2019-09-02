class Game < ActiveRecord::Base

  default_scope { order('date desc') }

  def self.find_previous_games game
    self.where('(home_team = ? OR visitor_team = ?) AND (home_team = ? OR visitor_team = ?)', game['Home'], game['Home'], game['Visitor'], game['Visitor']).order('date desc, time desc')
  end

  def game_time
    self.time.strftime('%I:%M %p')
  end

  def self.search_exact_game date, time, game
    self.where('date = ? and time = ?', date, time).find_previous_games(game).limit(1)
  end
end
