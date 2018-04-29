class CreateDeckCardsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :deck_cards do |t|
      t.belongs_to :card, index: true
      t.belongs_to :deck, index: true
      t.timestamps
    end
  end
end
