# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_16_095314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "localized_name"
    t.string "localized_name_short"
    t.string "full_name"
    t.bigint "region_id", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "address_full"
    t.string "address_short"
    t.string "phone"
    t.string "email"
    t.string "self_emloyed"
    t.string "inn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "work_schedule", default: "{}"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "localized_name"
    t.string "currency_code"
    t.string "currency_symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.string "localized_name"
    t.string "localized_name_short"
    t.string "full_name"
  end

  create_table "employment_types", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_titles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.integer "position", default: 0, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "status"
    t.string "category"
    t.string "name"
    t.jsonb "fields", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.string "anchor"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0, null: false
  end

  create_table "realties", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.string "slug"
    t.string "payments"
    t.text "description"
    t.bigint "team_member_id"
    t.bigint "realty_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_object"
    t.integer "city_id"
    t.integer "street_id"
    t.float "total_area"
    t.float "living_area"
    t.float "kitchen_area"
    t.integer "floor"
    t.integer "floors"
    t.integer "number_rooms"
    t.string "layout"
    t.string "house"
    t.string "flat"
    t.float "price"
    t.boolean "balcony", default: true
    t.integer "crm_id"
    t.string "latitude"
    t.string "longitude"
    t.index ["realty_category_id"], name: "index_realties_on_realty_category_id"
    t.index ["team_member_id"], name: "index_realties_on_team_member_id"
  end

  create_table "realty_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.string "slug"
  end

  create_table "realty_district_joins", force: :cascade do |t|
    t.integer "realty_id"
    t.integer "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "localized_name"
    t.string "localized_name_short"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author"
    t.string "email"
    t.text "feedback"
    t.float "rating"
    t.datetime "published_at"
    t.bigint "team_member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["team_member_id"], name: "index_reviews_on_team_member_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "page"
    t.string "page_name"
    t.string "meta_title"
    t.text "meta_keywords"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_links", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "district_id"
    t.string "localized_name"
    t.string "localized_name_short"
    t.string "complete_name"
    t.string "full_name"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_streets_on_city_id"
  end

  create_table "team_member_job_title_joins", force: :cascade do |t|
    t.integer "team_member_id"
    t.integer "job_title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic_name"
    t.string "slug"
    t.string "phone"
    t.string "email"
    t.text "info"
    t.boolean "whatsapp", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.float "rating"
    t.integer "position", default: 0, null: false
    t.boolean "best_agent", default: false
    t.integer "crm_id"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.string "location"
    t.bigint "job_title_id"
    t.string "experience"
    t.string "income_from"
    t.string "income_to"
    t.string "income_type"
    t.datetime "published_at"
    t.text "description"
    t.bigint "team_member_id"
    t.text "more_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["job_title_id"], name: "index_vacancies_on_job_title_id"
    t.index ["team_member_id"], name: "index_vacancies_on_team_member_id"
  end

  create_table "vacancy_employment_type_joins", force: :cascade do |t|
    t.integer "vacancy_id"
    t.integer "employment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancy_skill_joins", force: :cascade do |t|
    t.integer "vacancy_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cities", "regions"
end
