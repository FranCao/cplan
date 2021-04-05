class FixtrackReq < ActiveRecord::Migration[6.1]
  def change
  	add_foreign_key :track_requirements, :courses 
  end
end
