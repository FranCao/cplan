class RemoveUniquenessUidConstraintFromStudents < ActiveRecord::Migration[6.1]
  def change
  	remove_index :students, :uid, unique: true, name: 'uniq_uid'
  end
end
