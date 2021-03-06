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

ActiveRecord::Schema.define(version: 20150829212929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "needs", force: :cascade do |t|
    t.string   "resource"
    t.text     "notes"
    t.boolean  "complete",   default: false
    t.integer  "position"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "needs", ["position"], name: "index_needs_on_position", using: :btree
  add_index "needs", ["task_id"], name: "index_needs_on_task_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["position"], name: "index_plans_on_position", using: :btree
  add_index "plans", ["user_id"], name: "index_plans_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "doer",                       null: false
    t.boolean  "specific",   default: false
    t.string   "title"
    t.string   "full_name"
    t.string   "email"
    t.integer  "plan_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "roles", ["doer"], name: "index_roles_on_doer", using: :btree
  add_index "roles", ["specific"], name: "index_roles_on_specific", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "deed"
    t.text     "description"
    t.integer  "priority"
    t.integer  "position"
    t.boolean  "included",    default: false
    t.boolean  "inbox",       default: true
    t.integer  "minutes"
    t.integer  "plan_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["created_at"], name: "index_tasks_on_created_at", using: :btree
  add_index "tasks", ["plan_id"], name: "index_tasks_on_plan_id", using: :btree
  add_index "tasks", ["position"], name: "index_tasks_on_position", using: :btree
  add_index "tasks", ["priority"], name: "index_tasks_on_priority", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
