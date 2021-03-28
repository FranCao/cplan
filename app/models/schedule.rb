class Schedule < ApplicationRecord
    belongs_to :courses_offering
    belongs_to :student
    has_many :courses_offerings

end
