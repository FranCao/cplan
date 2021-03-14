require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

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
    expect(page).to have_xpath("//img[contains(@src,'Columbia_logo')]")
end