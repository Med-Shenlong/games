# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_17_142412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "games_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "test"
    t.date "release_date"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_games_on_category_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "games_posts", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "post_id", null: false
    t.index ["game_id", "post_id"], name: "index_games_posts_on_game_id_and_post_id"
    t.index ["post_id", "game_id"], name: "index_games_posts_on_post_id_and_game_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "subscriptions", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.index ["game_id", "user_id"], name: "index_subscriptions_on_game_id_and_user_id"
    t.index ["user_id", "game_id"], name: "index_subscriptions_on_user_id_and_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.boolean "confirmed", default: false
    t.string "confirmation_token"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.boolean "avatar", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "recover_password"
    t.string "role"
  end

  add_foreign_key "games", "categories"
  add_foreign_key "games", "users"
  add_foreign_key "posts", "users"
end
