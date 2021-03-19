class Track < ApplicationRecord
	has_many :students

	has_many :trackRequirements
	has_many :courses, through: :trackRequirements
end
