require 'uri'
require 'cgi'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /I am not logged in/ do
  page.has_link?("/auth/google_oauth2")
end

Given /I am logged in/ do
  session[:stub_student_id] = "stub_student_id"
end

Then /^(?:|I )should redirect to  (.+)$/ do |page_name|
	current_path = URI.parse(current_url).path
	assert page.current_path == page_name
end

# Given /I am on the home page/ do
#   visit path_to("home")
# end