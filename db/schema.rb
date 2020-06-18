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

ActiveRecord::Schema.define(version: 2020_06_14_153407) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "class"
    t.string "ability"
    t.integer "users_id"
    t.index ["users_id"], name: "index_characters_on_users_id"
  end

  create_table "equipments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "ability"
    t.integer "characters_id"
    t.index ["characters_id"], name: "index_equipments_on_characters_id"
  end

  create_table "team_characters", force: :cascade do |t|
    t.integer "team_id"
    t.integer "character_id"
    t.integer "characters_id"
    t.integer "teams_id"
    t.index ["characters_id"], name: "index_team_characters_on_characters_id"
    t.index ["teams_id"], name: "index_team_characters_on_teams_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "users_id"
    t.index ["users_id"], name: "index_teams_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
  end

end
