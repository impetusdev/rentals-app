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

ActiveRecord::Schema.define(version: 2022_02_13_121744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.text "street_address"
    t.float "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "suburb_id"
  end

  create_table "destinations_users", force: :cascade do |t|
    t.integer "destination_id"
    t.integer "user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.text "street_address"
    t.float "price"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "suburb_id"
    t.float "gym_travel_time"
    t.float "total_travel_time"
    t.integer "bedrooms"
    t.float "lat"
    t.float "lng"
  end

  create_table "rentals_users", force: :cascade do |t|
    t.integer "rental_id"
    t.integer "user_id"
  end

  create_table "suburbs", force: :cascade do |t|
    t.string "name"
    t.string "lga"
    t.integer "postcode"
    t.float "assault_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_times", force: :cascade do |t|
    t.integer "destination_id"
    t.integer "rental_id"
    t.float "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "password_digest"
    t.float "time_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
