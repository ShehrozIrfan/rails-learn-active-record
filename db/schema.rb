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

ActiveRecord::Schema.define(version: 2022_09_28_070831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefix"
    t.integer "products_count", default: 0
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "inventory"
    t.decimal "price", precision: 7, scale: 2
    t.integer "restocked_at"
    t.string "name"
    t.string "ref_num"
    t.bigint "style_id"
    t.boolean "is_sold", default: false
    t.integer "qty_sold", default: 0
    t.bigint "category_id"
    t.string "type"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["ref_num"], name: "index_products_on_ref_num"
    t.index ["style_id"], name: "index_products_on_style_id"
  end

  create_table "styles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "styles"
end
