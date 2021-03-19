class Student < ApplicationRecord
	belongs_to :track, optional: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |student|
            # student.uid = auth.info.uid
            student.first_name = auth.info.first_name
            student.last_name = auth.info.last_name
            student.email = auth.info.email
        end
    end
end
