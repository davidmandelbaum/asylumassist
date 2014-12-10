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

ActiveRecord::Schema.define(version: 20141118025855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "text"
    t.integer  "question_id"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["entry_id"], name: "index_answers_on_entry_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "entries", force: true do |t|
    t.integer  "user_id"
    t.text     "note"
    t.datetime "completed_at"
    t.boolean  "needs_translation"
    t.datetime "translated_at"
    t.text     "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["user_id"], name: "index_entries_on_user_id", using: :btree

  create_table "form_texts", force: true do |t|
    t.string   "title"
    t.text     "guidance"
    t.integer  "seq_no"
    t.text     "validations"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_texts", ["page_id"], name: "index_form_texts_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "seq_no"
    t.string   "name"
    t.text     "guidance"
    t.text     "validations"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["section_id"], name: "index_pages_on_section_id", using: :btree

  create_table "question_translations", force: true do |t|
    t.integer  "question_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "explanation"
  end

  add_index "question_translations", ["locale"], name: "index_question_translations_on_locale", using: :btree
  add_index "question_translations", ["question_id"], name: "index_question_translations_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.string   "form_id"
    t.string   "checkbox_value"
    t.text     "explanation"
    t.integer  "page_id"
    t.integer  "seq_no"
    t.text     "validations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["page_id"], name: "index_questions_on_page_id", using: :btree

  create_table "section_translations", force: true do |t|
    t.integer  "section_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "guidance"
  end

  add_index "section_translations", ["locale"], name: "index_section_translations_on_locale", using: :btree
  add_index "section_translations", ["section_id"], name: "index_section_translations_on_section_id", using: :btree

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "seq_no"
    t.text     "guidance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "curr_page"
    t.integer  "curr_entry"
    t.string   "locale"
    t.integer  "admin"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
