class CreateCoursesOfferings < ActiveRecord::Migration[6.1]
  def change
    drop_table :courses_offering
    create_table :courses_offerings do |t|
      t.string :year
      t.string :semester
      t.string :method
      t.string :call_number
      t.string :subject
      t.string :course_number
      t.string :section_number
      t.string :course_identifier
      t.string :course_name
      t.string :subterm_name
      t.string :subterm_code
      t.string :weekday
      t.string :instructor_name
      t.string :instructor_uni
      t.string :location_name
      t.string :location_room
      t.datetime :start_time_1
      t.datetime :end_time_1
      t.datetime :start_time_2
      t.datetime :end_time_2

      t.timestamps
    end
  end
end
