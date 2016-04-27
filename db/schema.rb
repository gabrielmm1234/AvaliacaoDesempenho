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

ActiveRecord::Schema.define(version: 20160421123639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_options", force: :cascade do |t|
    t.string   "option"
    t.string   "description"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answer_options", ["question_id"], name: "index_answer_options_on_question_id", using: :btree

  create_table "answer_options_questions", id: false, force: :cascade do |t|
    t.integer "answer_option_id", null: false
    t.integer "question_id",      null: false
  end

  create_table "evaluation_factors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_factors_models", id: false, force: :cascade do |t|
    t.integer "evaluation_factor_id", null: false
    t.integer "evaluation_model_id",  null: false
  end

  create_table "evaluation_factors_questions", id: false, force: :cascade do |t|
    t.integer "evaluation_factor_id", null: false
    t.integer "question_id",          null: false
  end

  create_table "evaluation_models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "evaluation_factor_id"
  end

  add_index "evaluation_models", ["evaluation_factor_id"], name: "index_evaluation_models_on_evaluation_factor_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "usuario_avaliado_id"
    t.integer  "usuario_avaliador_id"
    t.datetime "date"
    t.boolean  "done"
    t.integer  "evaluation_model_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "evaluations", ["evaluation_model_id"], name: "index_evaluations_on_evaluation_model_id", using: :btree

  create_table "junior_enterprises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "answer_option_id"
    t.string   "answer"
  end

  add_index "questions", ["answer_option_id"], name: "index_questions_on_answer_option_id", using: :btree

  create_table "request_histories", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "approved"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "role_id"
    t.integer  "junior_enterprise_id"
  end

  add_index "request_histories", ["junior_enterprise_id"], name: "index_request_histories_on_junior_enterprise_id", using: :btree
  add_index "request_histories", ["role_id"], name: "index_request_histories_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "profile_id"
    t.integer  "role_id"
    t.integer  "junior_enterprise_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["junior_enterprise_id"], name: "index_users_on_junior_enterprise_id", using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "answer_options", "questions"
  add_foreign_key "evaluation_models", "evaluation_factors"
  add_foreign_key "evaluations", "evaluation_models"
  add_foreign_key "questions", "answer_options"
  add_foreign_key "request_histories", "junior_enterprises"
  add_foreign_key "request_histories", "roles"
  add_foreign_key "users", "junior_enterprises"
  add_foreign_key "users", "profiles"
  add_foreign_key "users", "roles"
end
