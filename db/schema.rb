# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20210717185124) do

  create_table "attendance", force: true do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "status"
  end

  add_index "attendance", ["game_id"], name: "index_attendance_on_game_id", using: :btree
  add_index "attendance", ["player_id"], name: "index_attendance_on_player_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "season_id"
    t.string   "season_type"
    t.string   "season"
    t.date     "date"
    t.time     "time"
    t.string   "facility"
    t.string   "home_team"
    t.integer  "home_points"
    t.string   "visitor_team"
    t.integer  "visitor_points"
    t.string   "winning_team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "voting_open"
    t.string   "day_of_week"
  end

  add_index "games", ["home_team", "home_points"], name: "home_team_home_points", using: :btree
  add_index "games", ["season_id"], name: "index_games_on_season_id", using: :btree
  add_index "games", ["visitor_points"], name: "visitor_points", using: :btree
  add_index "games", ["visitor_team"], name: "visitor_team", using: :btree

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "number"
    t.string   "position"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.integer  "team_id"
    t.text     "team_key"
    t.string   "name"
    t.string   "division"
    t.integer  "year"
    t.string   "url"
    t.text     "standings"
    t.datetime "standings_cachetime"
    t.text     "stats"
    t.datetime "stats_cachetime"
    t.boolean  "active",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seasons", ["team_id"], name: "index_seasons_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "permalink"
    t.string   "name"
    t.string   "logo"
    t.string   "primary_color"
    t.string   "nav_color"
    t.boolean  "active",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "image"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.integer  "player_id"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["player_id"], name: "index_users_on_player_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "star_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["game_id"], name: "index_votes_on_game_id", using: :btree
  add_index "votes", ["player_id"], name: "index_votes_on_player_id", using: :btree
  add_index "votes", ["star_number"], name: "index_votes_on_star_number", using: :btree

end
