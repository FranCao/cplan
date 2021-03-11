class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :department
      t.string :course
      t.integer :section_num
      t.integer :call_num
      t.integer :day
      t.time :start
      t.time :end
      t.string :location
      t.string :instructor
      t.integer :enrollment
      t.string :semester
      t.integer :year

      t.timestamps
    end
    add_index :courses, :call_num, unique: true, name: 'uniq_call_num'
  end
end
