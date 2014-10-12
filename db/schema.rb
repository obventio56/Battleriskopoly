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

ActiveRecord::Schema.define(version: 20141012010010) do

  create_table "encampments", force: true do |t|
    t.string   "name"
    t.string   "date_created"
    t.integer  "xco"
    t.integer  "yco"
    t.integer  "troops"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "territory"
  end

  create_table "forts", force: true do |t|
    t.string   "name"
    t.integer  "xco"
    t.integer  "yco"
    t.float    "ownership"
    t.string   "date_created"
    t.integer  "trained_troops"
    t.integer  "untrained_troops"
    t.integer  "jeeps"
    t.integer  "blackhawks"
    t.integer  "cargo_aircraft"
    t.integer  "tanks"
    t.integer  "flagpoles"
    t.integer  "patrol_boats"
    t.integer  "cruisers"
    t.integer  "destroyers"
    t.integer  "submarines"
    t.integer  "battleships"
    t.integer  "aircraft_carriers"
    t.integer  "energy_units"
    t.integer  "food_units"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "territory"
  end

  create_table "legs", force: true do |t|
    t.string   "what"
    t.integer  "quantity"
    t.string   "durration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipient_fort_id"
    t.integer  "sending_fort_id"
    t.integer  "trade_id"
    t.integer  "sending_user_id"
    t.integer  "recipient_user_id"
  end

  create_table "trades", force: true do |t|
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sending_fort_id"
    t.integer  "recipient_fort_id"
    t.integer  "sending_user_id"
    t.integer  "recipient_user_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
