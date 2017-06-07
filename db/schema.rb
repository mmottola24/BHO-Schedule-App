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

ActiveRecord::Schema.define(version: 20160918040644) do

  create_table "games", force: true do |t|
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
