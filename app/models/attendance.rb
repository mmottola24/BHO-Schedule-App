class Attendance < ActiveRecord::Base
  belongs_to :games
  belongs_to :players

  enum satus: [:unanswered, :yes, :maybe, :no]

  default_scope { where('active = 1').order('year desc, division asc') }

end
