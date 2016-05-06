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

ActiveRecord::Schema.define(version: 20160506153810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "air_travels", force: :cascade do |t|
    t.integer  "transportation_id"
    t.integer  "d_economy"
    t.integer  "d_business"
    t.integer  "i_economy"
    t.integer  "i_premium_economy"
    t.integer  "i_business"
    t.integer  "i_first"
    t.integer  "sub_section_emissions"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "blocked_users", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "description"
    t.string   "points"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "progress_category"
  end

  create_table "diets", force: :cascade do |t|
    t.integer  "footprint_id"
    t.string   "diet_type"
    t.integer  "section_emissions"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "footprints", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "total_emissions"
    t.integer  "water_emissions"
    t.integer  "diet_emissions"
    t.integer  "transportation_emissions"
    t.integer  "waste_emissions"
    t.integer  "home_energy_emissions"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "habits", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "description"
    t.integer  "points"
    t.integer  "carbon_offset"
    t.integer  "effort"
    t.integer  "longevity_number"
    t.integer  "longevity_period"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "progress_category"
  end

  create_table "home_energies", force: :cascade do |t|
    t.integer  "footprint_id"
    t.integer  "fuel_oil_emissions"
    t.integer  "propane_emissions"
    t.integer  "natural_gas_emissions"
    t.integer  "electricity_emissions"
    t.integer  "section_emissions"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "newsfeed_items", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "source_id"
    t.string   "type"
    t.string   "header"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "profile_id"
    t.boolean  "unseen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.string   "text"
    t.string   "link"
  end

  create_table "pending_follows", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "pending_follower_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "pending_subscriptions", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "pending_following_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "privacy_settings", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "display_location"
    t.string   "display_stats"
    t.string   "display_feed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "profile_challenges", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "challenge_id"
    t.string   "completion_entry"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "completed"
    t.string   "progress_category"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "interests"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "state"
    t.string   "profile_pic"
  end

  create_table "public_transportations", force: :cascade do |t|
    t.integer  "transportation_id"
    t.boolean  "use"
    t.integer  "metro"
    t.integer  "commuter"
    t.integer  "inter_city"
    t.integer  "bus"
    t.integer  "taxi"
    t.integer  "sub_section_emissions"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sharing_settings", force: :cascade do |t|
    t.integer  "profile_id"
    t.boolean  "improvements"
    t.boolean  "follow"
    t.boolean  "footprint"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "following_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "transportations", force: :cascade do |t|
    t.integer  "footprint_id"
    t.integer  "vehicle_emissions"
    t.integer  "public_emissions"
    t.integer  "air_emissions"
    t.integer  "section_emissions"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "utilities", force: :cascade do |t|
    t.integer  "home_energy_id"
    t.boolean  "known"
    t.string   "name"
    t.string   "input_type"
    t.float    "input_amount"
    t.integer  "sub_section_emissions"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "transportation_id"
    t.boolean  "have"
    t.string   "vehicle_type"
    t.string   "fuel_type"
    t.integer  "mmonth"
    t.integer  "mpg"
    t.integer  "sub_section_emissions"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "wastes", force: :cascade do |t|
    t.integer  "footprint_id"
    t.boolean  "glass"
    t.boolean  "metal"
    t.boolean  "plastic"
    t.boolean  "newspaper"
    t.boolean  "magazines"
    t.integer  "section_emissions"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "waters", force: :cascade do |t|
    t.integer  "footprint_id"
    t.boolean  "use"
    t.boolean  "known"
    t.string   "measurement_type"
    t.float    "measurement_amount"
    t.integer  "section_emissions"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
