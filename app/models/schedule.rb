class Schedule < ApplicationRecord
    belongs_to :courses_offering
    belongs_to :student
end
