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

ActiveRecord::Schema.define(version: 20160704100515) do

  create_table "galleries", force: :cascade do |t|
    t.string   "title"
    t.integer  "primary_painting_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["primary_painting_id"], name: "index_galleries_on_primary_painting_id"
  end

  create_table "paintings", force: :cascade do |t|
    t.string   "title"
    t.integer  "gallery_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "primary"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["gallery_id"], name: "index_paintings_on_gallery_id"
  end

end
