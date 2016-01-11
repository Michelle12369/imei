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

ActiveRecord::Schema.define(version: 20160110083711) do

  create_table "marketings", force: :cascade do |t|
    t.string   "p_id"
    t.string   "p_name"
    t.integer  "r_inventory"
    t.float    "price"
    t.float    "price_origin"
    t.float    "increase"
    t.float    "profit"
    t.date     "valid_date"
    t.string   "retail_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "m_id"
    t.string   "m_name"
    t.integer  "m_cost"
    t.string   "supplier"
    t.integer  "transportation_time"
    t.integer  "number"
    t.string   "result"
    t.integer  "quality"
    t.string   "s_address"
    t.integer  "s_phone"
    t.integer  "condition"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "p_id"
    t.string   "p_name"
    t.integer  "p_inventory"
    t.date     "produce_date"
    t.integer  "cost"
    t.integer  "price"
    t.string   "factory"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "p_id"
    t.string   "p_name"
    t.integer  "number_sold"
    t.integer  "number_bought"
    t.date     "valid_date"
    t.integer  "temp"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "retailinforms", force: :cascade do |t|
    t.string   "p_id"
    t.integer  "max_demand"
    t.integer  "min_demand"
    t.integer  "r_inventory"
    t.integer  "book_cost"
    t.integer  "hold_cost"
    t.integer  "cost"
    t.integer  "price"
    t.float    "eoq"
    t.float    "rop"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
