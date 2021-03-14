Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
    visit path_to(page_name)
end

Given /the following students exist/ do |students_table|
    students_table.hashes.each do |student|
        Student.create student
    end
end