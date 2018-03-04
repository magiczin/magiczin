class AddDetailsToCards < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore" unless extension_enabled?("hstore")
    change_table :cards do |t|
      t.remove :image_url
      t.json :image_urls
      t.string :printings, array: true
    end
  end
end
