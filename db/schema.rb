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

ActiveRecord::Schema.define(version: 2021_03_14_224114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "year"
    t.string "semester"
    t.string "school_code"
    t.string "call_number"
    t.string "subject"
    t.string "course_number"
    t.string "section_number"
    t.string "course_identifier"
    t.string "course_name"
    t.string "subterm_name"
    t.string "subterm_code"
    t.string "time"
    t.string "instructor_name"
    t.string "instructor_uni"
    t.string "location_name"
    t.string "location_room"
    t.string "enrollment_max"
    t.string "enrollment_number"
    t.string "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["call_number"], name: "uniq_call_number", unique: true
  end

  create_table "students", force: :cascade do |t|
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
    t.string "major"
    t.index ["email"], name: "uniq_email", unique: true
  end

end
