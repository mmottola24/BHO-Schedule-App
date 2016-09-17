json.extract! player, :id, :first_name, :last_name, :position, :number, :active, :created_at, :updated_at
json.url player_url(player, format: :json)