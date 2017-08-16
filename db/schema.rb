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

ActiveRecord::Schema.define(version: 20170811075200) do

  create_table "applies", force: :cascade do |t|
    t.string   "student_name"
    t.integer  "user_id"
    t.integer  "study_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "applies", ["study_id"], name: "index_applies_on_study_id"
  add_index "applies", ["user_id"], name: "index_applies_on_user_id"

  create_table "offlines", force: :cascade do |t|
    t.string   "category"
    t.string   "team_name"
    t.string   "address"
    t.string   "name"
    t.string   "phone"
    t.text     "date"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "offlines", ["user_id"], name: "index_offlines_on_user_id"

  create_table "qna_replies", force: :cascade do |t|
    t.string   "qna_reply_user"
    t.text     "content"
    t.text     "code_content"
    t.string   "img"
    t.integer  "qna_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "qna_replies", ["qna_id"], name: "index_qna_replies_on_qna_id"
  add_index "qna_replies", ["user_id"], name: "index_qna_replies_on_user_id"

  create_table "qnas", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.text     "content"
    t.text     "code_content"
    t.string   "img"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "choice"
    t.string   "qna_user"
  end

  add_index "qnas", ["user_id"], name: "index_qnas_on_user_id"

  create_table "review_replies", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "review_replies", ["review_id"], name: "index_review_replies_on_review_id"
  add_index "review_replies", ["user_id"], name: "index_review_replies_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.string   "team_name"
    t.text     "content"
    t.boolean  "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "studies", force: :cascade do |t|
    t.string   "study_name"
    t.text     "study_time"
    t.text     "study_content"
    t.string   "study_pay"
    t.integer  "study_max"
    t.date     "study_due"
    t.string   "teacher_img"
    t.text     "teacher_intro"
    t.boolean  "study_pass"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "studies", ["user_id"], name: "index_studies_on_user_id"

  create_table "suggests", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "suggest_user"
  end

  add_index "suggests", ["user_id"], name: "index_suggests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "birthday"
    t.string   "phone"
    t.string   "part"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
