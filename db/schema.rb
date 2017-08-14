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

ActiveRecord::Schema.define(version: 20170814010536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer "player1_id"
    t.integer "player2_id"
    t.integer "next_match_id"
    t.integer "station_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_id"
    t.integer "child_match1_id"
    t.integer "child_match2_id"
    t.integer "tournament_id"
    t.integer "player1_score"
    t.integer "player2_score"
    t.integer "max_score"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_participations_on_player_id"
    t.index ["tournament_id"], name: "index_participations_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "creator_id", null: false
    t.string "tournament_name", null: false
    t.string "location"
    t.datetime "date_start", null: false
    t.datetime "date_end", null: false
    t.datetime "registration_start"
    t.datetime "registration_end"
    t.datetime "registration_length"
    t.boolean "is_published?", null: false
    t.boolean "is_finished?", null: false
    t.boolean "has_started?", null: false
    t.integer "champion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_score_per_round"
    t.index ["creator_id"], name: "index_tournaments_on_creator_id"
    t.index ["date_start"], name: "index_tournaments_on_date_start"
    t.index ["location"], name: "index_tournaments_on_location"
    t.index ["tournament_name"], name: "index_tournaments_on_tournament_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "tag", null: false
    t.string "phone_number"
    t.boolean "is_guest?", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["tag"], name: "index_users_on_tag"
  end

end
