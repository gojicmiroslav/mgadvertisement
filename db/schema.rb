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

ActiveRecord::Schema.define(version: 20151228220308) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "advertisement_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "advertisements", force: :cascade do |t|
    t.string   "title",                 limit: 255,                           default: "", null: false
    t.text     "description",           limit: 65535
    t.decimal  "price",                               precision: 7, scale: 3,              null: false
    t.date     "year",                                                                     null: false
    t.integer  "capacity",              limit: 4,                                          null: false
    t.integer  "power",                 limit: 4,                                          null: false
    t.decimal  "mileage",                             precision: 9, scale: 3
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "fuel_id",               limit: 4
    t.integer  "style_id",              limit: 4
    t.integer  "air_condition_id",      limit: 4
    t.integer  "exterior_color_id",     limit: 4
    t.integer  "interior_color_id",     limit: 4
    t.integer  "engine_id",             limit: 4
    t.integer  "drive_id",              limit: 4
    t.integer  "transmission_id",       limit: 4
    t.integer  "category_id",           limit: 4
    t.integer  "vehicle_model_id",      limit: 4
    t.integer  "user_id",               limit: 4
    t.integer  "advertisement_type_id", limit: 4
  end

  add_index "advertisements", ["advertisement_type_id"], name: "index_advertisements_on_advertisement_type_id", using: :btree
  add_index "advertisements", ["air_condition_id"], name: "index_advertisements_on_air_condition_id", using: :btree
  add_index "advertisements", ["category_id"], name: "index_advertisements_on_category_id", using: :btree
  add_index "advertisements", ["drive_id"], name: "index_advertisements_on_drive_id", using: :btree
  add_index "advertisements", ["engine_id"], name: "index_advertisements_on_engine_id", using: :btree
  add_index "advertisements", ["exterior_color_id"], name: "index_advertisements_on_exterior_color_id", using: :btree
  add_index "advertisements", ["fuel_id"], name: "index_advertisements_on_fuel_id", using: :btree
  add_index "advertisements", ["interior_color_id"], name: "index_advertisements_on_interior_color_id", using: :btree
  add_index "advertisements", ["style_id"], name: "index_advertisements_on_style_id", using: :btree
  add_index "advertisements", ["transmission_id"], name: "index_advertisements_on_transmission_id", using: :btree
  add_index "advertisements", ["user_id"], name: "index_advertisements_on_user_id", using: :btree
  add_index "advertisements", ["vehicle_model_id"], name: "index_advertisements_on_vehicle_model_id", using: :btree

  create_table "advertisements_options", id: false, force: :cascade do |t|
    t.integer "advertisement_id", limit: 4, null: false
    t.integer "option_id",        limit: 4, null: false
  end

  add_index "advertisements_options", ["advertisement_id"], name: "index_advertisements_options_on_advertisement_id", using: :btree
  add_index "advertisements_options", ["option_id"], name: "index_advertisements_options_on_option_id", using: :btree

  create_table "air_conditions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories_options", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4, null: false
    t.integer "option_id",   limit: 4, null: false
  end

  add_index "categories_options", ["category_id"], name: "index_categories_options_on_category_id", using: :btree
  add_index "categories_options", ["option_id"], name: "index_categories_options_on_option_id", using: :btree

  create_table "categories_vehicle_brands", id: false, force: :cascade do |t|
    t.integer "category_id",      limit: 4, null: false
    t.integer "vehicle_brand_id", limit: 4, null: false
  end

  add_index "categories_vehicle_brands", ["category_id"], name: "index_categories_vehicle_brands_on_category_id", using: :btree
  add_index "categories_vehicle_brands", ["vehicle_brand_id"], name: "index_categories_vehicle_brands_on_vehicle_brand_id", using: :btree

  create_table "colors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "drives", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "options", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transmissions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "deleted_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vehicle_brands", ["name"], name: "index_vehicle_brands_on_name", unique: true, using: :btree

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "category_id",      limit: 4
    t.integer  "vehicle_brand_id", limit: 4
  end

  add_index "vehicle_models", ["category_id"], name: "index_vehicle_models_on_category_id", using: :btree
  add_index "vehicle_models", ["vehicle_brand_id"], name: "index_vehicle_models_on_vehicle_brand_id", using: :btree

  add_foreign_key "advertisements", "advertisement_types", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "air_conditions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "categories", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "colors", column: "exterior_color_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "colors", column: "interior_color_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "drives", column: "drive_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "engines", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "fuels", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "styles", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "transmissions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "vehicle_models", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements_options", "advertisements"
  add_foreign_key "advertisements_options", "options"
  add_foreign_key "categories_options", "categories"
  add_foreign_key "categories_options", "options"
  add_foreign_key "categories_vehicle_brands", "categories"
  add_foreign_key "categories_vehicle_brands", "vehicle_brands"
  add_foreign_key "vehicle_models", "categories"
  add_foreign_key "vehicle_models", "vehicle_brands"
end
