class CreateBoosters < ActiveRecord::Migration[5.1]
  def change
    create_table :card_sets do |t|
      t.string :name
      t.string :code
      t.string :block
      t.string :set_type
      t.datetime :release_date
    end

    create_table :boosters do |t|
      t.belongs_to :card_set
    end

    change_table :cards do |t|
      t.belongs_to :booster
    end
  end
end
