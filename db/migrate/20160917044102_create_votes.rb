class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :star_number

      t.index :game_id
      t.index :player_id
      t.index :star_number

      t.timestamps
    end
  end
end
