Given /I am an admin and logged in/ do
    # request.session['stub_student_id'] => "1233"
    ENV['stub_student_id'] = "1"
  end

Given /I will be on the edit courses page for (.+)$/ do |c|
  # course = Course.find_by(course_identifier: c)
  visit edit_course_path(1)
end 

Given /I will be on the add courses page/ do
  visit add_course_path
end

Given /there are no existing courses/ do
  Course.delete_all
end