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

ActiveRecord::Schema.define(version: 20151104133929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "characters_encounters", id: false, force: true do |t|
    t.integer "character_id"
    t.integer "encounter_id"
  end

  add_index "characters_encounters", ["character_id"], name: "index_characters_encounters_on_character_id", using: :btree
  add_index "characters_encounters", ["encounter_id"], name: "index_characters_encounters_on_encounter_id", using: :btree

  create_table "creatures", force: true do |t|
    t.integer  "monster_id"
    t.integer  "encounter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "encounters", force: true do |t|
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "habitat_id"
  end

  add_index "encounters", ["habitat_id"], name: "index_encounters_on_habitat_id", using: :btree

  create_table "habitats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habitats_monsters", id: false, force: true do |t|
    t.integer "habitat_id"
    t.integer "monster_id"
  end

  add_index "habitats_monsters", ["habitat_id"], name: "index_habitats_monsters_on_habitat_id", using: :btree
  add_index "habitats_monsters", ["monster_id"], name: "index_habitats_monsters_on_monster_id", using: :btree

  create_table "monster_tags", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monster_tags_monsters", id: false, force: true do |t|
    t.integer "monster_tag_id"
    t.integer "monster_id"
  end

  add_index "monster_tags_monsters", ["monster_id"], name: "index_monster_tags_monsters_on_monster_id", using: :btree
  add_index "monster_tags_monsters", ["monster_tag_id"], name: "index_monster_tags_monsters_on_monster_tag_id", using: :btree

  create_table "monsters", force: true do |t|
    t.string   "name"
    t.string   "size"
    t.string   "nature"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "xp"
  end

end
