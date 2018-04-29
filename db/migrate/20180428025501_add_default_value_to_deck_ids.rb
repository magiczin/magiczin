class AddDefaultValueToDeckIds < ActiveRecord::Migration[5.1]
  def change
    change_column_default :decks, :main_cards_ids, from: nil, to: []
    change_column_default :decks, :sideboard_cards_ids, from: nil, to: []
  end
end
