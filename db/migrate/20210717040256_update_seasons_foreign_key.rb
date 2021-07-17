class UpdateSeasonsForeignKey < ActiveRecord::Migration
  def change
    add_column :seasons, :team_key, :text, after: :team_id
  end
end
