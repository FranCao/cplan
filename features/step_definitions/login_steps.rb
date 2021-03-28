require 'uri'
require 'cgi'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /I am not logged in/ do
  ENV['stub_student_id'] = nil
end

Given /I am logged in/ do
  # request.session['stub_student_id'] => "1233"
  ENV['stub_student_id'] = "1"
end

# Then /^(?:|I )should be on (.+)$/ do |page_name|
# 	# expect(page).to have_content(page_name)
# 	expect(page).to have_current_path(page_name)
# end

Then /I should redirect to Google Authentication/ do
	expect(page).to have_current_path(/signin\/oauth/)
end

Then /I should be back on the home page/ do
	expect(page).to have_current_path('/')
end

# When('I click "Sign in with Lionmail"') do
#   visit('/auth/google_oauth2/callback')
# end

When /^(?:|I )click "([^"]*)"$/ do |link|
  click_link(link)
end

When /I am on courses page/ do
	visit "/courses"
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    expect(page).to have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then('I should redirect to Audit Degree') do
  visit student_path(1)
end
