class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :permalink
      t.string :name
      t.string :logo
      t.string :primary_color
      t.string :nav_color

      t.boolean :active, default: true
      t.timestamps
    end
  end
end
