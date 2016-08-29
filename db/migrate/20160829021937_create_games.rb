class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :season_type
      t.string :season
      t.date :date
      t.time :time
      t.string :facility
      t.string :home_team
      t.integer :home_points
      t.string :visitor_team
      t.integer :visitor_points
      t.string :winning_team
      t.timestamps
    end
  end
end
