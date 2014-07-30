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

ActiveRecord::Schema.define(version: 20140730141252) do

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
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.text     "amenity_mask"
    t.boolean  "gym"
    t.boolean  "breakfast"
    t.boolean  "wifi"
    t.text     "tripadvisor_gif"
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
