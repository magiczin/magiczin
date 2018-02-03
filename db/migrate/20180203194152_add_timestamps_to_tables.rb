class AddTimestampsToTables < ActiveRecord::Migration[5.1]
  def change
    tables = %i[boosters card_sets cards sealeds]

    tables.map do |table|
      change_table table do |t|
        t.timestamps
      end
    end
  end
end
