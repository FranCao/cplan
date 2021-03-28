# Given /^(?:|I )am on the audit degree (.+)$/ do |page_name|
#     puts page_name,'======'
#     visit path_to(page_name)
# end

# Given /the following tracks exist/ do |tracks_table|
#     tracks_table.hashes.each do |track|
#         Track.create track
#     end
# end

Given /the following track_requirements exist/ do |track_requirements_table|
    track_requirements_table.hashes.each do |track_requirement|
        TrackRequirement.create track_requirement
    end
end

# Given /the following students exist/ do |students_table|
#     students_table.hashes.each do |student|
#         Student.create student
#     end
# end

# Given /the following courses exist/ do |courses_table|
#     courses_table.hashes.each do |course|
#         Course.create course
#     end
# end