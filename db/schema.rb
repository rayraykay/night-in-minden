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

ActiveRecord::Schema.define(version: 20171018205722) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "last_seen"
  end

  create_table "guests", force: :cascade do |t|
    t.integer "ticket"
    t.integer "table_id"
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "restrictions"
    t.string "password_digest"
    t.index ["table_id"], name: "index_guests_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "max_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
