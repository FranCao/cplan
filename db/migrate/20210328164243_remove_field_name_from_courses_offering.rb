class RemoveFieldNameFromCoursesOffering < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses_offerings, :student_id, :integer
  end
end
