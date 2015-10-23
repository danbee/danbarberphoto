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

ActiveRecord::Schema.define(version: 20151023163642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
    t.string   "base_colour", limit: 255
    t.integer  "sort"
    t.string   "slug",        limit: 255
  end

  create_table "categories_photos", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "photo_id"
  end

  add_index "categories_photos", ["category_id", "photo_id"], name: "index_categories_photos_on_category_id_and_photo_id", unique: true, using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "flickr_url",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",       limit: 255
    t.text     "description"
    t.integer  "sort"
    t.boolean  "featured",                default: false
    t.boolean  "enabled",                 default: true
    t.datetime "taken_at"
    t.integer  "views",                   default: 0
    t.string   "image_uid",   limit: 255
    t.string   "image_name",  limit: 255
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest", limit: 60
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
