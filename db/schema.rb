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

ActiveRecord::Schema.define(version: 2018_08_04_213722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_levels", force: :cascade do |t|
    t.integer "vitamin_c"
    t.integer "vitamin_d3"
    t.integer "iron"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activity_levels_on_user_id"
  end

  create_table "food_intakes", force: :cascade do |t|
    t.integer "vitamin_c"
    t.integer "vitamin_d3"
    t.integer "iron"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_intakes_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "vitamin_c"
    t.integer "vitamin_d3"
    t.integer "iron"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_level_id"
    t.bigint "food_intake_id"
    t.index ["activity_level_id"], name: "index_recipes_on_activity_level_id"
    t.index ["food_intake_id"], name: "index_recipes_on_food_intake_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.decimal "weight"
    t.decimal "height"
    t.decimal "bmi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activity_levels", "users"
  add_foreign_key "food_intakes", "users"
  add_foreign_key "recipes", "activity_levels"
  add_foreign_key "recipes", "food_intakes"
  add_foreign_key "recipes", "users"
end
