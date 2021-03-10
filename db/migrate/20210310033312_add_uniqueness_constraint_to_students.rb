class AddUniquenessConstraintToStudents < ActiveRecord::Migration[6.1]
  def change
  	add_index :students, :uid, unique: true, name: 'uniq_uid'
  end
end
