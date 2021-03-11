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

ActiveRecord::Schema.define(version: 2021_03_11_193854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "department"
    t.string "course"
    t.integer "section_num"
    t.integer "call_num"
    t.integer "day"
    t.time "start"
    t.time "end"
    t.string "location"
    t.string "instructor"
    t.integer "enrollment"
    t.string "semester"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["call_num"], name: "uniq_call_num", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "uid"
    t.string "last_name"
    t.string "first_name"
    t.string "degree"
    t.string "track"
    t.string "graduation_semester"
    t.integer "graduation_year"
    t.integer "initial_total_credit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["uid"], name: "uniq_uid", unique: true
  end

end
