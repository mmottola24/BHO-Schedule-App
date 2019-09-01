class Season < ActiveRecord::Base
  belongs_to :team
  has_many :games

  default_scope { where('active = 1').order('year desc, division asc') }
end
