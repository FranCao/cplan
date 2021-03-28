Then('I should see all the courses for the next semester') do
    expect(page).to have_content('Computer Vision II: Learning')
end