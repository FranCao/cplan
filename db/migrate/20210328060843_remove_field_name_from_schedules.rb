class RemoveFieldNameFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :integer, :string
  end
end
