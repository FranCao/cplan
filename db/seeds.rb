# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

students = [
	{
		:uid => 'lk123345',
		:last_name => 'kim',
		:first_name => 'leo',
		:degree => 'master',
		:track => 'software systems',
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10
	},
	{
		:uid => 'll123345',
		:last_name => 'lee',
		:first_name => 'leo',
		:degree => 'master',
		:track => 'software systems',
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10
	}
]

students.each do |student|
  Student.create!(student)
end