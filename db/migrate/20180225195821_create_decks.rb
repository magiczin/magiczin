class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :main_cards_ids, array: true
      t.integer :sideboard_cards_ids, array: true
    end
  end
end
