class CreateDrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :lobbies do |t|
      t.timestamps
    end

    create_table :drafts do |t|
      t.references :lobby
      t.timestamps
    end

    change_table :boosters do |t|
      t.references :draft
    end

    change_table :users do |t|
      t.references :lobby
      t.references :draft
    end
  end
end
