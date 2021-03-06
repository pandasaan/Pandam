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

ActiveRecord::Schema.define(version: 2019_02_16_044956) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre"], name: "index_genres_on_genre"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.integer "artist_id"
    t.string "image_id"
    t.integer "genre_id"
    t.integer "label_id"
    t.integer "price"
    t.integer "stock"
    t.integer "item_is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_items_on_title"
  end

  create_table "shipments", force: :cascade do |t|
    t.string "shipment_name"
    t.string "shipment_name_kana"
    t.string "shipment_postal_code"
    t.string "shipment_address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_address"], name: "index_shipments_on_shipment_address"
    t.index ["shipment_name"], name: "index_shipments_on_shipment_name"
    t.index ["shipment_name_kana"], name: "index_shipments_on_shipment_name_kana"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.string "name_kana", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "tell", default: "", null: false
    t.integer "user_is_deleted", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_users_on_address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["name_kana"], name: "index_users_on_name_kana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tell"], name: "index_users_on_tell"
  end

end
