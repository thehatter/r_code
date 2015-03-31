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

ActiveRecord::Schema.define(version: 20150331083311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "menu_id"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_items", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "site_id"
    t.string   "title"
    t.text     "body"
    t.string   "catalog_item_img"
    t.string   "slug"
    t.integer  "price"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
  end

  create_table "catalogs", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "menu_id"
    t.string   "title"
    t.string   "link_title"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  add_index "catalogs", ["menu_id"], name: "index_catalogs_on_menu_id", using: :btree
  add_index "catalogs", ["site_id"], name: "index_catalogs_on_site_id", using: :btree
  add_index "catalogs", ["slug"], name: "index_catalogs_on_slug", using: :btree

  create_table "categories", force: :cascade do |t|
    t.integer  "catalog_id"
    t.integer  "site_id"
    t.string   "title"
    t.string   "category_img"
    t.string   "slug"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "catalog_item_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",        default: 1
    t.string   "currency"
    t.integer  "order_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "menu_id"
    t.integer  "catalog_id"
    t.integer  "weight"
    t.string   "link"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blog_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "title"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "site_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "menu_id"
    t.string   "title"
    t.string   "link_title"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["menu_id"], name: "index_pages_on_menu_id", using: :btree
  add_index "pages", ["site_id"], name: "index_pages_on_site_id", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "blog_id"
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "catalog_id"
    t.integer  "section_id"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "domain"
    t.string   "sub_domain"
    t.string   "name"
    t.string   "site_logo"
    t.integer  "user_id"
    t.integer  "front_page_id"
    t.text     "footer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_slot_1"
    t.string   "theme"
    t.string   "owner_email"
    t.boolean  "shop_active",     default: false
    t.string   "big_image_text"
    t.boolean  "leftbar_onfront"
    t.string   "currency",        default: "BYR"
  end

  create_table "sub_owners", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
