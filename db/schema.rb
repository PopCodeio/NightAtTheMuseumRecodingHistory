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

ActiveRecord::Schema.define(version: 20141109164417) do

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id"
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "comment"
    t.boolean  "deleted",     default: false
    t.integer  "deleted_by"
    t.datetime "deleted_att"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "source_db_id",               default: 0,  null: false
    t.string   "title",                      default: "", null: false
    t.string   "date",                       default: "", null: false
    t.date     "source_date"
    t.text     "description",    limit: 255, default: "", null: false
    t.string   "source_id",                  default: "", null: false
    t.string   "source",                     default: "", null: false
    t.string   "found",                      default: "", null: false
    t.string   "creator",                    default: "", null: false
    t.string   "subject",                    default: "", null: false
    t.string   "rights",                     default: "", null: false
    t.string   "picture",                    default: "", null: false
    t.datetime "time_line_date"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_actions", force: true do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: true do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: true do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: true do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.boolean  "deleted",     default: false
    t.integer  "deleted_by"
    t.datetime "deleted_att"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tags", force: true do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.integer  "item_id"
    t.boolean  "deleted",     default: false
    t.integer  "deleted_by"
    t.datetime "deleted_att"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "first_name",             default: "",   null: false
    t.string   "last_name",              default: "",   null: false
    t.string   "address",                default: "",   null: false
    t.string   "city",                   default: "",   null: false
    t.string   "state",                  default: "",   null: false
    t.string   "zip_code",               default: "",   null: false
    t.string   "country",                default: "",   null: false
    t.string   "time_zone",              default: "",   null: false
    t.string   "phone",                  default: "",   null: false
    t.string   "gender",                 default: "",   null: false
    t.string   "occupation",             default: "",   null: false
    t.string   "language",               default: "en"
    t.string   "photo",                  default: ""
    t.boolean  "active",                 default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sash_id"
    t.integer  "level",                  default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
