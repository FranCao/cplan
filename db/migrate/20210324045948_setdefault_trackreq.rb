class SetdefaultTrackreq < ActiveRecord::Migration[6.1]
  def change
  	remove_column :track_requirements, :is_breadth_requirement

  	add_column :track_requirements, :is_systems_breadth_requirement, :boolean, :default => false
  	add_column :track_requirements, :is_theory_breadth_requirement, :boolean, :default => false
  	add_column :track_requirements, :is_aiapplications_breadth_requirement, :boolean, :default => false
  end
end
