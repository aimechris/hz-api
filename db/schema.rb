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

ActiveRecord::Schema.define(version: 20180806193703) do

  create_table "advertisers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "avatar"
    t.string "email"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "email_confirmed"
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "about"
    t.string "avatar"
    t.string "email"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "email_confirmed"
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_favorites_on_listing_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "feature_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listimages", force: :cascade do |t|
    t.string "image"
    t.integer "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listimages_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "address"
    t.integer "zip_code", limit: 8
    t.string "city"
    t.string "state"
    t.integer "bed", limit: 8
    t.integer "bath", limit: 8
    t.decimal "sqft", precision: 30, scale: 20
    t.string "property_type"
    t.integer "built_year", limit: 8
    t.string "sale_type"
    t.decimal "price", precision: 15, scale: 2
    t.string "title"
    t.text "description"
    t.string "virtual_tour"
    t.string "display_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
  end

  create_table "messages", force: :cascade do |t|
    t.text "mssg_txt"
    t.integer "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_messages_on_listing_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.integer "category_id"
    t.string "subtitle"
    t.text "content"
    t.integer "tag_id"
    t.string "post_image", null: false
    t.string "status", default: "draft", null: false
    t.string "published_by"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["tag_id"], name: "index_posts_on_tag_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "url_search"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "location"
    t.string "avatar"
    t.string "email"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "email_confirmed"
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
