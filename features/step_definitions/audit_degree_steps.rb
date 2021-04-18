
Given /the following track_requirements exist/ do |track_requirements_table|
    track_requirements_table.hashes.each do |track_requirement|
        TrackRequirement.create track_requirement
    end
end

Given /the following taken_courses exist/ do |course_taken_table|
	course_taken_table.hashes.each do |course_taken|
		TakenCourse.create course_taken
	end
end
