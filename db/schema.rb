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

ActiveRecord::Schema.define(version: 20170826190845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id", using: :btree
  end

  create_table "all_done_tasks", force: :cascade do |t|
    t.date     "confirmed_on", null: false
    t.string   "card_code",    null: false
    t.string   "card_name",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "auths", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "provider",    null: false
    t.string   "uid"
    t.string   "screen_name"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_auths_on_user_id", using: :btree
  end

  create_table "breakdowns", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id", "name"], name: "index_breakdowns_on_category_id_and_name", unique: true, using: :btree
    t.index ["category_id"], name: "index_breakdowns_on_category_id", using: :btree
  end

  create_table "cancels", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_cancels_on_user_id", using: :btree
  end

  create_table "captures", force: :cascade do |t|
    t.date     "published_on"
    t.integer  "charge"
    t.string   "category_name"
    t.string   "breakdown_name"
    t.string   "place_name"
    t.text     "memo"
    t.integer  "user_id",        null: false
    t.text     "tags"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "comment"
    t.integer  "category_id"
    t.integer  "breakdown_id"
    t.integer  "place_id"
    t.index ["breakdown_id"], name: "index_captures_on_breakdown_id", using: :btree
    t.index ["breakdown_name"], name: "index_captures_on_breakdown_name", using: :btree
    t.index ["category_id"], name: "index_captures_on_category_id", using: :btree
    t.index ["category_name"], name: "index_captures_on_category_name", using: :btree
    t.index ["place_id"], name: "index_captures_on_place_id", using: :btree
    t.index ["place_name"], name: "index_captures_on_place_name", using: :btree
    t.index ["user_id"], name: "index_captures_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "barance_of_payments", default: false, null: false
    t.integer  "user_id",                             null: false
    t.integer  "position",                            null: false
    t.integer  "breakdowns_count",    default: 0,     null: false
    t.integer  "places_count",        default: 0,     null: false
    t.integer  "records_count",       default: 0,     null: false
    t.index ["user_id"], name: "index_categories_on_user_id", using: :btree
  end

  create_table "categorize_places", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "place_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id", "place_id"], name: "index_categorize_places_on_category_id_and_place_id", unique: true, using: :btree
    t.index ["category_id"], name: "index_categorize_places_on_category_id", using: :btree
    t.index ["place_id"], name: "index_categorize_places_on_place_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.boolean  "checked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "feedback_id"
    t.text     "content",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        default: false, null: false
    t.datetime "sent_at",                     null: false
    t.index ["feedback_id"], name: "index_messages_on_feedback_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "monthly_counts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.integer  "month"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.index ["user_id"], name: "index_monthly_counts_on_user_id", using: :btree
  end

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "post_at"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
    t.index ["user_id", "name"], name: "index_places_on_user_id_and_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "records", force: :cascade do |t|
    t.date     "published_on", null: false
    t.integer  "charge",       null: false
    t.integer  "breakdown_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      null: false
    t.integer  "place_id"
    t.integer  "category_id",  null: false
    t.index ["breakdown_id"], name: "index_records_on_breakdown_id", using: :btree
    t.index ["category_id"], name: "index_records_on_category_id", using: :btree
    t.index ["place_id"], name: "index_records_on_place_id", using: :btree
    t.index ["user_id"], name: "index_records_on_user_id", using: :btree
  end

  create_table "tagged_records", force: :cascade do |t|
    t.integer  "record_id",  null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["record_id", "tag_id"], name: "index_tagged_records_on_record_id_and_tag_id", unique: true, using: :btree
    t.index ["record_id"], name: "index_tagged_records_on_record_id", using: :btree
    t.index ["tag_id"], name: "index_tagged_records_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "color_code", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "color_code"], name: "index_tags_on_user_id_and_color_code", unique: true, using: :btree
    t.index ["user_id", "name"], name: "index_tags_on_user_id_and_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_tags_on_user_id", using: :btree
  end

  create_table "tallies", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "year",       null: false
    t.integer  "month"
    t.text     "list",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tallies_on_user_id", using: :btree
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "tokenizable_type"
    t.integer  "tokenizable_id",   null: false
    t.string   "token",            null: false
    t.text     "data"
    t.datetime "expires_at"
    t.datetime "created_at",       null: false
    t.index ["expires_at"], name: "index_tokens_on_expires_at", using: :btree
    t.index ["token"], name: "index_tokens_on_token", using: :btree
    t.index ["tokenizable_id", "tokenizable_type", "name"], name: "index_tokens_on_tokenizable_id_and_tokenizable_type_and_name", unique: true, using: :btree
    t.index ["tokenizable_type", "tokenizable_id"], name: "index_tokens_on_tokenizable_type_and_tokenizable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.string   "nickname"
    t.string   "type"
    t.string   "code"
    t.integer  "status"
    t.string   "password_digest"
    t.boolean  "breakdown_field",        default: true
    t.boolean  "place_field",            default: true
    t.boolean  "memo_field",             default: true
    t.boolean  "tag_field",              default: true
    t.string   "new_email"
    t.string   "currency"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
