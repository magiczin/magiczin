# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180121190448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boosters", force: :cascade do |t|
    t.bigint "card_set_id"
    t.index ["card_set_id"], name: "index_boosters_on_card_set_id"
  end

  create_table "card_sets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "block"
    t.string "set_type"
    t.datetime "release_date"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "mana_cost"
    t.integer "cmc"
    t.text "colors", array: true
    t.string "card_type"
    t.text "supertypes", array: true
    t.text "subtypes", array: true
    t.string "rarity"
    t.text "text"
    t.text "flavor"
    t.integer "power"
    t.integer "toughness"
    t.integer "loyalty"
    t.text "rulings"
    t.string "image_url"
    t.string "set"
    t.string "set_name"
    t.bigint "booster_id"
    t.index ["booster_id"], name: "index_cards_on_booster_id"
  end

end
