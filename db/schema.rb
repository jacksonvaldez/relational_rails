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

ActiveRecord::Schema.define(version: 2021_12_02_180717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.boolean "alive"
    t.integer "monthly_listeners"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bakeries", force: :cascade do |t|
    t.string "name"
    t.boolean "is_open"
    t.integer "customer_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bakers", force: :cascade do |t|
    t.string "name"
    t.boolean "is_working"
    t.integer "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "bakery_id"
    t.index ["bakery_id"], name: "index_bakers_on_bakery_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.boolean "top_100"
    t.integer "length_s"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
  end

  add_foreign_key "bakers", "bakeries"
  add_foreign_key "songs", "artists"
end
