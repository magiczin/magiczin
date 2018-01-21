class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :mana_cost
      t.integer :cmc
      t.text :colors, array: true
      t.string :card_type
      t.text :supertypes, array: true
      t.text :subtypes, array: true
      t.string :rarity
      t.text :text
      t.text :flavor
      t.integer :power
      t.integer :toughness
      t.integer :loyalty
      t.text :rulings
      t.string :image_url
      t.string :set
      t.string :set_name
    end
  end
end
