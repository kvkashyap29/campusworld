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

ActiveRecord::Schema.define(version: 2019_02_07_145403) do

  create_table "attendences", force: :cascade do |t|
    t.string "status"
    t.date "date"
    t.string "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.date "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "admission_number"
    t.string "department"
    t.string "year_of_admission"
    t.string "year_of_completion"
    t.string "gender"
    t.date "DOB"
    t.string "Image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "textbooks", force: :cascade do |t|
    t.text "name"
    t.text "image"
    t.text "author"
    t.text "publications"
    t.text "dlink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
create_table :security_questions do |t|
  t.string :locale, null: false
  t.string :name, null: false
end

SecurityQuestion.create! locale: :de, name: 'what\'s your mother\'s surname?'
SecurityQuestion.create! locale: :de, name: 'Where were you born?'
SecurityQuestion.create! locale: :de, name: 'your pet\'s name?'
SecurityQuestion.create! locale: :de, name: 'where were you born?'

create_table :the_resources do |t|
  # other devise fields

  t.integer :security_question_id
  t.string :security_question_answer
end
end
