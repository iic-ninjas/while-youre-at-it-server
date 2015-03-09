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

ActiveRecord::Schema.define(version: 20150309151931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shop_requests", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "trip_id",                null: false
    t.integer  "status",     default: 0, null: false
    t.text     "items",                  null: false, array: true
    t.integer  "offer",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "shopper_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "facebook_id",                                         null: false
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",                                   default: 0, null: false
    t.string   "first_name",                                          null: false
    t.string   "last_name",                                           null: false
    t.string   "street_address"
    t.string   "city"
    t.decimal  "latitude",       precision: 10, scale: 6
    t.decimal  "longitude",      precision: 10, scale: 6
  end

  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id", unique: true, using: :btree

end
