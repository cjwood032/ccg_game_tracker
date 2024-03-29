# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2018_09_05_215345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ccg_users", force: :cascade do |t|
    t.integer "ccg_id"
    t.integer "user_id"
  end

  create_table "ccgs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.integer "wins"
    t.integer "losses"
    t.integer "user_id"
    t.integer "ccg_id"
    t.string "link"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "decktags", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "tag_id"
  end

  create_table "game_tags", force: :cascade do |t|
    t.integer "game_id"
    t.integer "tag_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "deck_id"
    t.text "result"
    t.text "opponent_deck"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "comment"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "game_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "uid"
    t.string "Username"
  end

end
