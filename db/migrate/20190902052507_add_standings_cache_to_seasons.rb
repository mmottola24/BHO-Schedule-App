class AddStandingsCacheToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :standings, :text, after: :url
    add_column :seasons, :standings_cachetime, :datetime, after: :standings
  end
end
