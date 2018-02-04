class AddGameTypeToLobbies < ActiveRecord::Migration[5.1]
  def change
    add_column :lobbies, :game_type, :string
  end
end
