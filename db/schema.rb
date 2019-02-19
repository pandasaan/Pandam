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

ActiveRecord::Schema.define(version: 2019_02_18_110526) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", default: "", null: false
    t.text "comment", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_name"], name: "index_artists_on_artist_name"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "amount", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.string "disc_name"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre"], name: "index_genres_on_genre"
  end

  create_table "items", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "artist_id", null: false
    t.string "image_id"
    t.integer "genre_id", null: false
    t.integer "label_id", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.integer "item_is_deleted", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_items_on_title"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label"], name: "index_labels_on_label"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "amount", null: false
    t.integer "order_price", null: false
    t.integer "order_id", null: false
    t.integer "cancell_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "order_name", default: "", null: false
    t.string "order_postal_code", default: "", null: false
    t.string "order_address", default: "", null: false
    t.integer "total_price", null: false
    t.integer "dlv_status", default: 0, null: false
    t.integer "cancell_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string "shipment_name", default: "", null: false
    t.string "shipment_name_kana", default: "", null: false
    t.string "shipment_postal_code", default: "", null: false
    t.string "shipment_address", default: "", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_address"], name: "index_shipments_on_shipment_address"
    t.index ["shipment_name"], name: "index_shipments_on_shipment_name"
    t.index ["shipment_name_kana"], name: "index_shipments_on_shipment_name_kana"
  end

  create_table "tunes", force: :cascade do |t|
    t.string "tune_name", default: "", null: false
    t.integer "disc_id", null: false
    t.integer "index", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", default: "", null: false
    t.string "name_kana", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "tell", default: "", null: false
    t.integer "user_is_deleted", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["address"], name: "index_users_on_address"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["name_kana"], name: "index_users_on_name_kana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tell"], name: "index_users_on_tell"
  end

end
