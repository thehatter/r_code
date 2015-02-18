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

ActiveRecord::Schema.define(version: 20150218104749) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_items", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "site_id"
    t.string   "title",            limit: 255
    t.text     "body"
    t.string   "catalog_item_img", limit: 255
    t.string   "slug",             limit: 255
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",         limit: 255
  end

  create_table "catalogs", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "menu_id"
    t.string   "title",      limit: 255
    t.string   "link_title", limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  add_index "catalogs", ["menu_id"], name: "index_catalogs_on_menu_id"
  add_index "catalogs", ["site_id"], name: "index_catalogs_on_site_id"
  add_index "catalogs", ["slug"], name: "index_catalogs_on_slug"

  create_table "categories", force: :cascade do |t|
    t.integer  "catalog_id"
    t.integer  "site_id"
    t.string   "title",        limit: 255
    t.string   "category_img", limit: 255
    t.string   "slug",         limit: 255
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "line_items", force: :cascade do |t|
    t.integer  "catalog_item_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",                    default: 1
    t.string   "currency",        limit: 255
    t.integer  "order_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "menu_id"
    t.integer  "catalog_id"
    t.integer  "weight"
    t.string   "link",       limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "title",         limit: 255
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_on_front"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "site_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "menu_id"
    t.string   "title",      limit: 255
    t.string   "link_title", limit: 255
    t.string   "slug",       limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["menu_id"], name: "index_pages_on_menu_id"
  add_index "pages", ["site_id"], name: "index_pages_on_site_id"
  add_index "pages", ["slug"], name: "index_pages_on_slug"

  create_table "sections", force: :cascade do |t|
    t.integer  "catalog_id"
    t.integer  "section_id"
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "domain",         limit: 255
    t.string   "sub_domain",     limit: 255
    t.string   "name",           limit: 255
    t.string   "site_logo",      limit: 255
    t.integer  "user_id"
    t.integer  "front_page_id"
    t.text     "footer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_slot_1",   limit: 255
    t.string   "theme",          limit: 255
    t.string   "owner_email",    limit: 255
    t.boolean  "shop_active",                default: false
    t.string   "big_image_text", limit: 255
  end

  create_table "sub_owners", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.string   "password",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
