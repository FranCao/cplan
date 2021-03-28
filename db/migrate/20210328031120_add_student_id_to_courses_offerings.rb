class AddStudentIdToCoursesOfferings < ActiveRecord::Migration[6.1]
  def change
    add_column :courses_offerings, :student_id, :integer
  end
end
