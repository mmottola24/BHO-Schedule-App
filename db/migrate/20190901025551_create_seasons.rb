class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :team_id
      t.string :name
      t.string :division
      t.integer :year
      t.string :url

      t.boolean :active, default: true
      t.timestamps

      t.index :team_id
    end

    add_reference :games, :season, index: true, after: :id
  end
end
