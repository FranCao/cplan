class Course < ApplicationRecord
	has_many :trackRequirements
	has_many :tracks, through: :trackRequirements
	has_many :taken_courses
	has_many :students, through: :taken_courses
end
