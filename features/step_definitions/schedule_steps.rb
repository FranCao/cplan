Then('I should see all the courses for the next semester') do
    expect(page).to have_content('Computer Vision II: Learning')
end

Then /I should see "Add"/ do
    expect(page).to have_link('Add', href: add_schedule_path)
end

Given /the following courses_offerings exist/ do |courses_offerings_table|
    courses_offerings_table.hashes.each do |course|
        CoursesOffering.create course
    end
end