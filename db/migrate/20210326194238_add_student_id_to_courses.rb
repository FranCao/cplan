class AddStudentIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :student_id, :int
  end
end
