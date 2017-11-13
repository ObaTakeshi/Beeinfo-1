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

ActiveRecord::Schema.define(version: 20171110141246) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "user"
    t.string   "title"
    t.date     "date"
    t.text     "text",        limit: 65535
    t.string   "url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "category_id"
    t.integer  "trend_id"
    t.index ["category_id"], name: "index_edits_on_category_id", using: :btree
    t.index ["trend_id"], name: "index_edits_on_trend_id", using: :btree
  end

  create_table "edits_twitters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "edit_id"
    t.integer  "twitter_datum_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["edit_id"], name: "index_edits_twitters_on_edit_id", using: :btree
    t.index ["twitter_datum_id"], name: "index_edits_twitters_on_twitter_datum_id", using: :btree
  end

  create_table "trend_twitters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "trend_id"
    t.integer  "twitter_datum_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["trend_id"], name: "index_trend_twitters_on_trend_id", using: :btree
    t.index ["twitter_datum_id"], name: "index_trend_twitters_on_twitter_datum_id", using: :btree
  end

  create_table "trends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitter_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "trend"
    t.text     "tweet",         limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "tweet_id"
    t.text     "image_url",     limit: 65535
    t.string   "user"
    t.string   "user_id"
    t.text     "user_icon_url", limit: 65535
    t.datetime "tweet_time"
    t.text     "tweet_url",     limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, length: { email: 191 }, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, length: { reset_password_token: 191 }, using: :btree
  end

  add_foreign_key "edits_twitters", "edits"
  add_foreign_key "edits_twitters", "twitter_data"
  add_foreign_key "trend_twitters", "trends"
  add_foreign_key "trend_twitters", "twitter_data"
end
