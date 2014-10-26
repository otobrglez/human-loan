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

ActiveRecord::Schema.define(version: 20141026094246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inquiries", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.integer  "score",           default: 0
    t.datetime "expires_at",                      null: false
    t.text     "reason",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inquiries", ["user_id"], name: "index_inquiries_on_user_id", using: :btree

  create_table "loans", force: true do |t|
    t.integer  "giver_id"
    t.integer  "taker_id"
    t.integer  "inquiry_id"
    t.integer  "option",     default: 0
    t.integer  "insured",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["giver_id"], name: "index_loans_on_giver_id", using: :btree
  add_index "loans", ["taker_id"], name: "index_loans_on_taker_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
