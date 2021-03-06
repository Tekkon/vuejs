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

ActiveRecord::Schema.define(version: 2019_10_10_153219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "client_organizations", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "organization_id"
    t.index ["client_id", "organization_id"], name: "index_client_organizations_on_client_id_and_organization_id", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_token", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.string "phone"
    t.boolean "reset_password"
    t.index ["api_token"], name: "index_clients_on_api_token", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", null: false
    t.string "type_name", null: false
    t.string "serial_number", null: false
    t.bigint "organization_id"
  end

  create_table "organization_types", force: :cascade do |t|
    t.string "title"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "title"
    t.integer "organization_type_id"
    t.string "inn"
    t.string "ogrn"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_token", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.string "phone"
    t.boolean "reset_password"
    t.index ["api_token"], name: "index_staffs_on_api_token", unique: true
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  add_foreign_key "client_organizations", "clients"
  add_foreign_key "client_organizations", "organizations"
  add_foreign_key "equipment", "organizations"
end
