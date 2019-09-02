class CreateAttendance < ActiveRecord::Migration
  def change
    create_table :attendance do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :status

      t.index :game_id
      t.index :player_id
    end
  end
end
