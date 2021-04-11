class AddNumberOfTrackElectivesToTrack < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :number_of_track_electives, :integer
  end
end
