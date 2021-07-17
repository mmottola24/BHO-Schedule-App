class AddStatsCacheToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :stats, :text, after: :standings_cachetime
    add_column :seasons, :stats_cachetime, :datetime, after: :stats
  end
end
