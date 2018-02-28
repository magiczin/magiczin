class AddTypesToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :types, :text, array: true
  end
end
