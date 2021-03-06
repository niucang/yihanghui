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

ActiveRecord::Schema.define(version: 2018_10_15_153007) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "advertisings", force: :cascade do |t|
    t.string "hyperlink"
    t.string "img_url"
    t.string "img_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
  end

  create_table "coupon_open_images", force: :cascade do |t|
    t.string "img_url"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hyperlink"
  end

  create_table "coupon_types", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "desc"
    t.string "link"
  end

  create_table "coupons", force: :cascade do |t|
    t.integer "gift_id"
    t.integer "from_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coupon_type_id"
    t.index ["from_id"], name: "index_coupons_on_from_id"
    t.index ["gift_id"], name: "index_coupons_on_gift_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "shared_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "favicon"
    t.string "company"
    t.string "job"
    t.string "mobile_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "openid"
    t.string "sex"
    t.string "language"
    t.string "city"
    t.string "province"
    t.string "headimgurl"
    t.string "country"
    t.boolean "admin", default: false
    t.string "password_digest"
    t.index ["openid"], name: "index_users_on_openid"
  end

  create_table "wechat_configs", force: :cascade do |t|
    t.string "environment", default: "development", null: false
    t.string "account", null: false
    t.boolean "enabled", default: true
    t.string "appid"
    t.string "secret"
    t.boolean "encrypt_mode"
    t.string "encoding_aes_key"
    t.string "token", null: false
    t.string "access_token", null: false
    t.string "jsapi_ticket", null: false
    t.boolean "skip_verify_ssl", default: true
    t.integer "timeout", default: 20
    t.string "trusted_domain_fullname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment", "account"], name: "index_wechat_configs_on_environment_and_account", unique: true
  end

end
