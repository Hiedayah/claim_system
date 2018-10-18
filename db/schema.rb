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

ActiveRecord::Schema.define(version: 2018_10_18_110505) do

  create_table "claims", force: :cascade do |t|
    t.date "date"
    t.integer "verifier_id"
    t.integer "approver_id"
    t.integer "staff_id"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.date "expense_date"
    t.string "description"
    t.integer "expense_type"
    t.string "file"
    t.integer "claim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "expense_value"
  end

  create_table "justifications", force: :cascade do |t|
    t.string "approver_message"
    t.string "verifier_message"
    t.string "staff_message"
    t.integer "claim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "description"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "bank_account"
    t.string "bank_name"
    t.integer "company"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_view"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

end
