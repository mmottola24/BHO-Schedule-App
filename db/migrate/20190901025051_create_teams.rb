class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :short_name
      t.string :logo

      t.boolean :active, default: true
      t.timestamps
    end
  end
end
