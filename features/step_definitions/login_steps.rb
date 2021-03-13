require 'uri'
require 'cgi'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /I am not logged in/ do
  page.has_link?("/auth/google_oauth2")
end

Given /I am logged in/ do
  # request.session['stub_student_id'] => "1233"
  ENV['stub_student_id'] = "1233"
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
	# expect(page).to have_content(page_name)
	expect(page).to have_current_path(page_name)
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
<<<<<<< HEAD
=======

Then /I should not see my id/ do
	# expect(page).to have_content('Start Planning')
	expect(page).not_to have_content("Log out")
end
>>>>>>> main
