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

ActiveRecord::Schema.define(version: 20140712191919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.text     "message"
    t.integer  "amount",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bids", ["user_id", "event_id"], name: "index_bids_on_user_id_and_event_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "title",       null: false
    t.string   "address",     null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "zip"
    t.datetime "start_time",  null: false
    t.datetime "end_time"
    t.integer  "guest_count", null: false
    t.integer  "budget",      null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["title", "city", "user_id"], name: "index_events_on_title_and_city_and_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.text     "body",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["sender_id", "receiver_id"], name: "index_messages_on_sender_id_and_receiver_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",                              null: false
    t.string   "last_name",                               null: false
    t.string   "email",                  default: "",     null: false
    t.string   "address"
    t.string   "city",                                    null: false
    t.string   "state",                                   null: false
    t.string   "zip"
    t.string   "profile_photo"
    t.text     "about"
    t.string   "role",                   default: "user", null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
