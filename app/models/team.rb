class Team < ActiveRecord::Base
  has_many :seasons

  default_scope { where('active = 1').order('name') }

  def self.find_by_permalink permalink
    self.where(permalink: permalink)
  end

  def active_season
    self.seasons.first
  end
end
