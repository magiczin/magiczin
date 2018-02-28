class AddLegalitiesToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :legalities, :jsonb, array: true
  end
end
