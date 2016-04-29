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

ActiveRecord::Schema.define(version: 20160429062655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "institution"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "type"
    t.integer  "four"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "aliases", force: :cascade do |t|
    t.string   "payee"
    t.string   "memo"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "aliases", ["account_id"], name: "index_aliases_on_account_id", using: :btree
  add_index "aliases", ["vendor_id"], name: "index_aliases_on_vendor_id", using: :btree

  create_table "fillups", force: :cascade do |t|
    t.date     "date"
    t.integer  "odometer"
    t.decimal  "gallons"
    t.decimal  "ppg"
    t.string   "brand"
    t.string   "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vehicle_id"
  end

  add_index "fillups", ["vehicle_id"], name: "index_fillups_on_vehicle_id", using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "member_id",       null: false
    t.string   "member_type",     null: false
    t.integer  "group_id"
    t.string   "group_type"
    t.string   "group_name"
    t.string   "membership_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name", using: :btree
  add_index "group_memberships", ["group_type", "group_id"], name: "index_group_memberships_on_group_type_and_group_id", using: :btree
  add_index "group_memberships", ["member_type", "member_id"], name: "index_group_memberships_on_member_type_and_member_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string "type"
  end

  create_table "transactions", force: :cascade do |t|
    t.date     "date"
    t.string   "action"
    t.integer  "vendor_id"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "account_id"
    t.decimal  "quantity"
    t.text     "memo"
    t.decimal  "commission"
    t.string   "payee"
    t.integer  "transfer_id"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id", using: :btree
  add_index "transactions", ["vendor_id"], name: "index_transactions_on_vendor_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "vin"
    t.binary   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "content_type"
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "symbol"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "aliases", "accounts"
  add_foreign_key "aliases", "vendors"
  add_foreign_key "fillups", "vehicles"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "vendors"
  add_foreign_key "vehicles", "users"
end
