# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

students = [
	{
		:last_name => 'kim',
		:first_name => 'leo',
		:degree => 'master',
		:major => 'Computer Science',
		:track => 'Software Systems',
		:email => 'kimleo@columbia.edu',
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10
	},
	{
		:last_name => 'lee',
		:first_name => 'leo',
		:degree => 'master',
		:major => 'Computer Science',
		:track => 'Software Systems',
		:email => 'leeleo@columbia.edu',
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10
	},
	{
		:last_name => 'liang',
		:first_name => 'yunbo',
		:degree => 'master',
		:major => 'Computer Science',
		:track => 'Machine Learning',
		:email => 'liangyunbo@columbia.edu',
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10
	}
]

students.each do |student|
  Student.find_or_create_by(student)
end

courses = [
	{
		:year => "2021",
		:semester => "Summer",
		:school_code => "SEAS",
		:call_number => "11494",
		:subject => "COMS",
		:course_number => "4732",
		:section_number => "1",
		:course_identifier => "COMSW4732",
		:course_name => "Computer Vision II: Learning",
		:subterm_name => "05/03-06/14",
		:subterm_code => "A",
		:time => "TR 10:10AM-12:40PM",
		:instructor_name => "Carl Vondrick",
		:instructor_uni => "cv2428",
		:location_name => "",
		:location_room => "ONLINE",
		:enrollment_max => "120",
		:enrollment_number => "33",
		:method => "On-Line Only",
	}
]

courses.each do |course|
  Course.find_or_create_by(course)
end