class AddEmailUniqueConstraintToStudents < ActiveRecord::Migration[6.1]
  def change
  	add_index :students, :email, unique: true, name: 'uniq_email'
  end
end
