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

ActiveRecord::Schema.define(version: 2018_12_17_165215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.string "weekday"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "plat_id"
    t.string "name"
    t.string "ingredienttype"
    t.integer "quantity"
    t.boolean "instock", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "weekof"
    t.string "season"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "startdate"
  end

  create_table "plats", force: :cascade do |t|
    t.bigint "repas_id"
    t.string "name"
    t.string "plattype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repas", force: :cascade do |t|
    t.string "repastype"
    t.bigint "day_id"
    t.boolean "athome", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "ingredient_id"
    t.string "actionverb"
    t.string "daydue"
    t.string "comments"
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "beginweek"
    t.string "groceryshopping"
    t.boolean "everyday", default: true
    t.boolean "breakfast", default: true
    t.boolean "lunch", default: true
    t.boolean "dinner", default: true
    t.boolean "collation", default: true
    t.boolean "starter", default: true
    t.boolean "maincourse", default: true
    t.boolean "dessert", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
