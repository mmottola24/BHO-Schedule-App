class Game < ActiveRecord::Base

  def self.find_previous_games game
    self.where('(home_team = ? OR visitor_team = ?) AND (home_team = ? OR visitor_team = ?)', game['Home'], game['Home'], game['Visitor'], game['Visitor']).order('date desc, time desc')
  end
end
