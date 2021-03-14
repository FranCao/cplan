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

Then /^(?:|I )should see "([^"]*)"$/ do |text|
    if page.respond_to? :should
      expect(page).to have_content(text)
    else
      assert page.has_content?(text)
    end
end

When /^(?:|I )press "([^"]*)"$/ do |button|
    click_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end
  
When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
    fill_in(field, :with => value)
end
  
When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
    select(value, :from => field)
end