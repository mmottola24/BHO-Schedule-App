class Team < ActiveRecord::Base
  has_many :seasons

  default_scope { where('active = 1').order('name') }
end
