# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


tracks = [
	{
		name: "computer biology",
	},
	{
		name: "computer security",
	},
	{
		name: "foundations of computer science",
	},
	{
		name: "machine learning",
	},
	{
		name: "natural language processing",
	},
	{
		name: "network systems",
	},
	{
		name: "software systems",
	},
	{
		name: "vision, graphics, interaction, and robotics"
	}
]

tracks.each do |track|
	Track.find_or_create_by(track)
end

courses = [
	{
		:year => "2021",
		:semester => "Summer",
		:call_number => "11494",
		:subject => "COMS",
		:course_number => "4732",
		:course_identifier => "COMSW4732",
		:course_name => "Computer Vision II: Learning"
	},
	{
		:year => "2021",
		:semester => "Summer",
		:call_number => "12175",
		:subject => "CSOR",
		:course_number => "4231",
		:course_identifier => "CSORW4231",
		:course_name => "ANALYSIS OF ALGORITHMS I"
	},
	{
		:year => "2021",
		:semester => "Summer",
		:call_number => "12375",
		:subject => "CSOR",
		:course_number => "4231",
		:course_identifier => "COMSW4111",
		:course_name => "ANALYSIS OF ALGORITHMS I"
	}
]

courses.each do |course|
  Course.find_or_create_by(course)
end

# trackRequirements = [
# 	{
# 		course_id: 2,
# 		track_id: 7,
# 		is_general_elective: false,
# 		is_systems_breadth_requirement: true,
# 		is_theory_breadth_requirement: false,
# 		is_aiapplications_breadth_requirement: false,
# 		is_required: false
# 	}
# ]

# trackRequirements.each do |trackRequirement|
# 	Course.find(trackRequirement[:course_id]).trackRequirements.find_or_create_by(trackRequirement)
# end

students = [
	{
		:last_name => 'kim',
		:first_name => 'leo',
		:email => 'kimleo@columbia.edu',
		:major => "Computer Science",
		:degree => "Master of Science",
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10,
		:track_id => 7,
	},
	{
		:last_name => 'lee',
		:first_name => 'leo',
		:email => 'leeleo@columbia.edu',
		:major => "Computer Science",
		:degree => "Master of Science",
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10,
		:track_id => 1
	},
	{
		:last_name => 'liang',
		:first_name => 'yunbo',
		:email => 'liangyunbo@columbia.edu',
		:major => "Computer Science",
		:degree => "Master of Science",
		:graduation_semester => 'spring',
		:graduation_year => 2021,
		:initial_total_credit => 10,
		:track_id => 4
	}
]

students.each do |student|
	Track.find(student[:track_id]).students.find_or_create_by(student)
  # Student.find_or_create_by(student)
end

courses_offerings = [
	{
		:year => "2021",
		:semester => "Summer",
		:method => "On-Line Only",
		:call_number => "11494",
		:subject => "COMS",
		:course_number => "4732",
		:section_number => "1",
		:course_identifier => "COMSW4732",
		:course_name => "Computer Vision II: Learning",
		:subterm_name => "05/03-06/14",
		:subterm_code => "A",
		:weekday => "MW",
		:instructor_name => "Carl Vondrick",
		:instructor_uni => "cv2428",
		:location_name => "",
		:location_room => "ONLINE",
		:start_time_1 => DateTime.new(2021,5,3,10,10),
		:end_time_1 => DateTime.new(2021,5,3,12,40),
		:start_time_2 => DateTime.new(2021,5,5,10,10),
		:end_time_2 => DateTime.new(2021,5,5,12,40)
	},
	{
		:year => "2021",
		:semester => "Summer",
		:method => "On-Line Only",
		:call_number => "12175",
		:subject => "CSOR",
		:course_number => "4231",
		:section_number => "1",
		:course_identifier => "CSORW4231",
		:course_name => "ANALYSIS OF ALGORITHMS I",
		:subterm_name => "05/03-06/14",
		:subterm_code => "A",
		:weekday => "TR",
		:instructor_name => "Xi Chen",
		:instructor_uni => "xc2198",
		:location_name => "",
		:location_room => "ONLINE",
		:start_time_1 => DateTime.new(2021,5,4,16,10),
		:end_time_1 => DateTime.new(2021,5,4,18,40),
		:start_time_2 => DateTime.new(2021,5,6,16,10),
		:end_time_2 => DateTime.new(2021,5,6,18,40)
	}
]

courses_offerings.each do |course|
  CoursesOffering.find_or_create_by(course)
end


Dir[Rails.root.join('db/*_seeds.rb')].sort.each do |file|
puts "Processing #{file.split('/').last}"
require file
end




