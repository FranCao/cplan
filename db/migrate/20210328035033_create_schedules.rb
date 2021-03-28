class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :student_id
      t.string :courses_offering_id
      t.string :integer

      t.timestamps
    end
  end
end
