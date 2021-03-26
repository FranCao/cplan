class ChangeCourses < ActiveRecord::Migration[6.1]
  def change
    rename_table :courses, :courses_offering
    create_table :courses do |t|
      t.string  :year
      t.string  :semester
      t.string  :call_number
      t.string  :subject
      t.string  :course_number
      t.string  :course_identifier
      t.string  :course_name
    end
  end
end
