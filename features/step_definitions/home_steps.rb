require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /I am on the home page/ do
    visit home_path
end

# Then /I should see the CPlan logo/ do
#     page.should have_xpath("//img[@src=\"/assets/cplan-logo-eb0d83b5ba91fa41a7fbf188f1e5c3032a229da1c30d0537b3a1d983ffc52bdf.png\"]")

Then /I should see the CPlan logo/ do
    expect(page).to have_xpath("//img[contains(@src,'cplan-logo')]")
end

Then('I should see “Sign in”') do
    expect(page).to have_content('Sign in')
end

Then('I should see “Start Planning”') do
    expect(page).to have_content('Start Planning')
end

# Then('I should see "#(.*)"') do |keyword|
#     expect(page.should have_content(keyword))
# end

Then('I should see a Columbia University logo') do
    expect(page).to have_xpath("//img[contains(@src,'header-example1-bp')]")
end