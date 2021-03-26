class Course < ApplicationRecord
	has_many :trackRequirements
	has_many :tracks, through: :trackRequirements
end
