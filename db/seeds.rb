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
		:department => 'COMS',
		:course => 'W4111',
		:section_num => 1,
		:call_num => 11926,
		:day => 80,
		:start => Time.parse('13:10 UTC'),
		:end => Time.parse('14:25 UTC'),
		:location => 'ONLINE',
		:instructor => 'Kenneth A Ross',
		:enrollment => 175,
		:semester => 'Spring',
		:year => 2021
	},
	{
		:department => 'COMS',
		:course => 'W4111',
		:section_num => 2,
		:call_num => 11927,
		:day => 4,
		:start => Time.parse('10:10 UTC'),
		:end => Time.parse('12:40 UTC'),
		:location => 'International Affairs: Building',
		:instructor => 'Donald F Ferguson',
		:enrollment => 250,
		:semester => 'Spring',
		:year => 2021
	},
	{
		:department => 'COMS',
		:course => 'W4111',
		:section_num => 3,
		:call_num => 13636,
		:day => 8,
		:start => Time.parse('10:10 UTC'),
		:end => Time.parse('12:40 UTC'),
		:location => 'ONLINE',
		:instructor => 'Alexandros Biliris',
		:enrollment => 100,
		:semester => 'Spring',
		:year => 2021
	},
]

courses.each do |course|
  Course.find_or_create_by(course)
end