class AddPlayerIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :player, index: true
  end
end
