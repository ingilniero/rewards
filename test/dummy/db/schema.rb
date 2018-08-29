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

ActiveRecord::Schema.define(version: 20180828035117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rewards_bestowments", force: :cascade do |t|
    t.bigint "bestower_id"
    t.bigint "bestowed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bestowed_id"], name: "index_rewards_bestowments_on_bestowed_id"
    t.index ["bestower_id"], name: "index_rewards_bestowments_on_bestower_id"
  end

  create_table "rewards_pieces", force: :cascade do |t|
    t.bigint "reward_id"
    t.bigint "bestowment_id"
    t.integer "identifier", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bestowment_id"], name: "index_rewards_pieces_on_bestowment_id"
    t.index ["reward_id"], name: "index_rewards_pieces_on_reward_id"
  end

  create_table "rewards_rewards", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "state", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rewards_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rewards_bestowments", "users", column: "bestowed_id"
  add_foreign_key "rewards_bestowments", "users", column: "bestower_id"
  add_foreign_key "rewards_pieces", "rewards_bestowments", column: "bestowment_id"
  add_foreign_key "rewards_pieces", "rewards_rewards", column: "reward_id"
  add_foreign_key "rewards_rewards", "users"
end
