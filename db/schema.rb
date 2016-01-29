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

ActiveRecord::Schema.define(version: 20160129034042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocked_users", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "description"
    t.string   "points"
    t.integer  "progress_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "completed_challenges", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "challenge_id"
    t.integer  "progress_category_id"
    t.string   "completion_entry"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "completed_habits", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "habit_id"
    t.integer  "progress_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "followers", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "following_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "habits", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "description"
    t.integer  "points"
    t.integer  "carbon_offset"
    t.integer  "effot"
    t.integer  "longevity_number"
    t.integer  "longevity_period"
    t.integer  "progress_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "pending_followers", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pending_followings", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "following_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "privacy_settings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "display_location"
    t.string   "display_stats"
    t.string   "display_feed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "interests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "started_challenges", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "challenge_id"
    t.integer  "progress_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "started_habits", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "habit_id"
    t.integer  "progress_category_id"
    t.integer  "check_ins"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "state"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
