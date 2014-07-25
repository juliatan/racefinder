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

ActiveRecord::Schema.define(version: 20140725181536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.integer  "hotel_id"
    t.text     "address"
    t.float    "lat"
    t.float    "long"
    t.float    "price"
    t.float    "rating"
    t.float    "tripadvisor_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.float    "ref_lat"
    t.float    "ref_long"
    t.integer  "race_id"
  end

  add_index "hotels", ["race_id"], name: "index_hotels_on_race_id", using: :btree

  create_table "races", force: true do |t|
    t.text     "name"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "start_lat"
    t.float    "start_long"
    t.float    "finish_lat"
    t.float    "finish_long"
  end

end
