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

ActiveRecord::Schema.define(version: 20180304031054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "boosters", force: :cascade do |t|
    t.bigint "card_set_id"
    t.bigint "draft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_set_id"], name: "index_boosters_on_card_set_id"
    t.index ["draft_id"], name: "index_boosters_on_draft_id"
  end

  create_table "card_sets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "block"
    t.string "set_type"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "set"
    t.string "set_name"
    t.bigint "booster_id"
    t.integer "multiverse_id"
    t.bigint "sealed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "types", array: true
    t.jsonb "legalities", array: true
    t.json "image_urls"
    t.string "printings", array: true
    t.index ["booster_id"], name: "index_cards_on_booster_id"
    t.index ["sealed_id"], name: "index_cards_on_sealed_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.integer "main_cards_ids", array: true
    t.integer "sideboard_cards_ids", array: true
  end

  create_table "drafts", force: :cascade do |t|
    t.bigint "lobby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_drafts_on_lobby_id"
  end

  create_table "lobbies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "number_of_players"
  end

  create_table "sealeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lobby_id"
    t.bigint "draft_id"
    t.index ["draft_id"], name: "index_users_on_draft_id"
    t.index ["lobby_id"], name: "index_users_on_lobby_id"
  end

end
