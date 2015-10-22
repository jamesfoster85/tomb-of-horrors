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

ActiveRecord::Schema.define(version: 20151021165249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

end