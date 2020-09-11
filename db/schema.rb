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

ActiveRecord::Schema.define(version: 2020_09_11_152849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cart_selections", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "buyer_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "cart_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "seller_id"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "price"
    t.integer "hours"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "product_id"
    t.integer "buyer_id"
    t.integer "score"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "product_id"
    t.integer "rating_id"
    t.string "description"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "company"
    t.string "title"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "product_id"
  end

end
