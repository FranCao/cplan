class AddNumberOfGeneralElectivesToTrack < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :number_of_general_electives, :integer
  end
end
