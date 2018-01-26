class CreateSealed < ActiveRecord::Migration[5.1]
  def change
    create_table :sealeds do |t|
    end

    add_reference :cards, :sealed
  end
end
