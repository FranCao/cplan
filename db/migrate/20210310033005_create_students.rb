class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :uid
      t.string :last_name
      t.string :first_name
      t.string :degree
      t.string :track
      t.string :graduation_semester
      t.integer :graduation_year
      t.integer :initial_total_credit

      t.timestamps
    end
  end
end
