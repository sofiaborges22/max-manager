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

ActiveRecord::Schema.define(version: 20161030113840) do

  create_table "break_evens", force: :cascade do |t|
    t.string   "title"
    t.float    "fixed_cost"
    t.float    "selling_price"
    t.float    "variable_cost"
    t.integer  "problem_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["problem_id"], name: "index_break_evens_on_problem_id"
  end

  create_table "crossovers", force: :cascade do |t|
    t.string   "title"
    t.float    "units"
    t.float    "fixed_cost"
    t.float    "variable_cost"
    t.integer  "problem_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["problem_id"], name: "index_crossovers_on_problem_id"
  end

  create_table "decisions", force: :cascade do |t|
    t.string   "title"
    t.float    "associated_cost"
    t.integer  "favorable_probability"
    t.float    "unfavorable_probability"
    t.float    "favorable_result"
    t.float    "unfavorable_result"
    t.integer  "problem_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["problem_id"], name: "index_decisions_on_problem_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

end
