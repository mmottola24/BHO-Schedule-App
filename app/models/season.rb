class Season < ActiveRecord::Base
  belongs_to :team
  has_many :games

  default_scope { where('active = 1 and team_key = "' + ENV['TEAM_KEY'] + '"').order('year desc, division asc') }
end
