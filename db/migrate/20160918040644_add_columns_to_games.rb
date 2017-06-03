class AddColumnsToGames < ActiveRecord::Migration
  def change
    add_column :games, :voting_open, :boolean
    add_column :games, :day_of_week, :string
  end
end
