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

ActiveRecord::Schema.define(version: 2021_04_05_011004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "year"
    t.string "semester"
    t.string "call_number"
    t.string "subject"
    t.string "course_number"
    t.string "course_identifier"
    t.string "course_name"
    t.integer "student_id"
  end

  create_table "courses_offering", force: :cascade do |t|
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

  create_table "courses_offerings", force: :cascade do |t|
    t.string "year"
    t.string "semester"
    t.string "method"
    t.string "call_number"
    t.string "subject"
    t.string "course_number"
    t.string "section_number"
    t.string "course_identifier"
    t.string "course_name"
    t.string "subterm_name"
    t.string "subterm_code"
    t.string "weekday"
    t.string "instructor_name"
    t.string "instructor_uni"
    t.string "location_name"
    t.string "location_room"
    t.datetime "start_time_1"
    t.datetime "end_time_1"
    t.datetime "start_time_2"
    t.datetime "end_time_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "student_id"
    t.integer "courses_offering_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "degree"
    t.string "graduation_semester"
    t.integer "graduation_year"
    t.integer "initial_total_credit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "major"
    t.bigint "track_id"
    t.index ["email"], name: "uniq_email", unique: true
    t.index ["track_id"], name: "index_students_on_track_id"
  end

  create_table "taken_courses", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "track_requirements", force: :cascade do |t|
    t.bigint "track_id"
    t.bigint "course_id"
    t.boolean "is_general_elective"
    t.boolean "is_required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_systems_breadth_requirement", default: false
    t.boolean "is_theory_breadth_requirement", default: false
    t.boolean "is_aiapplications_breadth_requirement", default: false
    t.index ["course_id"], name: "index_track_requirements_on_course_id"
    t.index ["track_id"], name: "index_track_requirements_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "students", "tracks"
  add_foreign_key "track_requirements", "courses"
  add_foreign_key "track_requirements", "tracks"
end
