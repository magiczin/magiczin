class AddNameToLobbies < ActiveRecord::Migration[5.1]
  def change
    change_table :lobbies do |t|
      t.string :name
      t.integer :number_of_players
    end
  end
end
