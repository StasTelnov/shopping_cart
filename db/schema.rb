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

ActiveRecord::Schema.define(version: 20150809164435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id",             null: false
    t.integer  "cart_id",                null: false
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id", "cart_id"], name: "index_line_items_on_product_id_and_cart_id", unique: true, using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",                          null: false
    t.text     "description",                    null: false
    t.string   "image_url",                      null: false
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "products_sales", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "sale_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products_sales", ["product_id", "sale_id"], name: "index_products_sales_on_product_id_and_sale_id", unique: true, using: :btree
  add_index "products_sales", ["product_id"], name: "index_products_sales_on_product_id", using: :btree
  add_index "products_sales", ["sale_id"], name: "index_products_sales_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "discount",   default: 5, null: false
    t.integer  "quantity",   default: 1, null: false
    t.string   "title",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
  add_foreign_key "products_sales", "products"
  add_foreign_key "products_sales", "sales"
end
