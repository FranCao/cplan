class ChangeCoursesOfferingIdToBeIntegerInSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :courses_offering_id, 'integer USING CAST(courses_offering_id AS integer)'
  end
end
