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

ActiveRecord::Schema.define(version: 20180419001459) do

  create_table "benefiteds", force: :cascade do |t|
    t.integer "age"
    t.string "preferences"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "foundation_id"
    t.integer "help_id"
    t.integer "picture_id"
    t.string "avatar"
    t.index ["foundation_id"], name: "index_benefiteds_on_foundation_id"
    t.index ["help_id"], name: "index_benefiteds_on_help_id"
    t.index ["picture_id"], name: "index_benefiteds_on_picture_id"
  end

  create_table "contributor_events", force: :cascade do |t|
    t.integer "contributor_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_contributor_events_on_contributor_id"
    t.index ["event_id"], name: "index_contributor_events_on_event_id"
  end

  create_table "contributors", force: :cascade do |t|
    t.string "description"
    t.string "user"
    t.string "name"
    t.string "lastname"
    t.string "email", default: "", null: false
    t.string "phone"
    t.string "type_user"
    t.string "token_reset_pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "help_id"
    t.integer "interest_id"
    t.integer "pictures_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "authentication_token", limit: 30
    t.string "avatar"
    t.index ["authentication_token"], name: "index_contributors_on_authentication_token", unique: true
    t.index ["email"], name: "index_contributors_on_email", unique: true
    t.index ["help_id"], name: "index_contributors_on_help_id"
    t.index ["interest_id"], name: "index_contributors_on_interest_id"
    t.index ["pictures_id"], name: "index_contributors_on_pictures_id"
    t.index ["reset_password_token"], name: "index_contributors_on_reset_password_token", unique: true
  end

  create_table "contributors_events", id: false, force: :cascade do |t|
    t.integer "contributor_id", null: false
    t.integer "event_id", null: false
    t.index ["contributor_id"], name: "index_contributors_events_on_contributor_id"
    t.index ["event_id"], name: "index_contributors_events_on_event_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "bio"
    t.string "user"
    t.string "name"
    t.string "lastname"
    t.string "email", default: "", null: false
    t.string "phone"
    t.string "type_user"
    t.string "token_reset_pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "foundation_id"
    t.integer "picture_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "authentication_token", limit: 30
    t.string "avatar"
    t.index ["authentication_token"], name: "index_directors_on_authentication_token", unique: true
    t.index ["email"], name: "index_directors_on_email", unique: true
    t.index ["foundation_id"], name: "index_directors_on_foundation_id"
    t.index ["picture_id"], name: "index_directors_on_picture_id"
    t.index ["reset_password_token"], name: "index_directors_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "startDate"
    t.string "direction"
    t.float "latitude"
    t.float "longitude"
    t.string "description"
    t.boolean "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "foundation_id"
    t.integer "evidence_id"
    t.index ["evidence_id"], name: "index_events_on_evidence_id"
    t.index ["foundation_id"], name: "index_events_on_foundation_id"
  end

  create_table "evidences", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "picture_id"
    t.string "avatar"
    t.index ["event_id"], name: "index_evidences_on_event_id"
    t.index ["picture_id"], name: "index_evidences_on_picture_id"
  end

  create_table "foundations", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "director_id"
    t.integer "benefited_id"
    t.integer "interest_id"
    t.integer "picture_id"
    t.string "avatar"
    t.index ["benefited_id"], name: "index_foundations_on_benefited_id"
    t.index ["director_id"], name: "index_foundations_on_director_id"
    t.index ["event_id"], name: "index_foundations_on_event_id"
    t.index ["interest_id"], name: "index_foundations_on_interest_id"
    t.index ["picture_id"], name: "index_foundations_on_picture_id"
  end

  create_table "helps", force: :cascade do |t|
    t.string "description"
    t.datetime "startDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contributor_id"
    t.integer "benefited_id"
    t.integer "support_id"
    t.integer "type_of_help_id"
    t.integer "status_of_help_id"
    t.index ["benefited_id"], name: "index_helps_on_benefited_id"
    t.index ["contributor_id"], name: "index_helps_on_contributor_id"
    t.index ["status_of_help_id"], name: "index_helps_on_status_of_help_id"
    t.index ["support_id"], name: "index_helps_on_support_id"
    t.index ["type_of_help_id"], name: "index_helps_on_type_of_help_id"
  end

  create_table "interest_contributors", force: :cascade do |t|
    t.integer "contributor_id"
    t.integer "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_interest_contributors_on_contributor_id"
    t.index ["interest_id"], name: "index_interest_contributors_on_interest_id"
  end

  create_table "interest_foundations", force: :cascade do |t|
    t.integer "foundation_id"
    t.integer "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foundation_id"], name: "index_interest_foundations_on_foundation_id"
    t.index ["interest_id"], name: "index_interest_foundations_on_interest_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contributor_id"
    t.integer "foundation_id"
    t.index ["contributor_id"], name: "index_interests_on_contributor_id"
    t.index ["foundation_id"], name: "index_interests_on_foundation_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "status_of_helps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "help_id"
    t.index ["help_id"], name: "index_status_of_helps_on_help_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "description"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "help_id"
    t.integer "picture_id"
    t.string "avatar"
    t.index ["help_id"], name: "index_supports_on_help_id"
    t.index ["picture_id"], name: "index_supports_on_picture_id"
  end

  create_table "type_of_helps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "help_id"
    t.index ["help_id"], name: "index_type_of_helps_on_help_id"
  end

end
