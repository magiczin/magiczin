class CreateDrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :drafts do |t|
      t.timestamps
    end

    change_table :boosters do |t|
      t.references :draft
    end
  end
end
