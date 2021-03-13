Feature: Create Profile
    As a first time user, I need to fill out my profile to proceed to other features
    If I am not logged in, I should redirect to homepage

Background:Given I am logged in
Scenario: CS major, Software systems track
    Given I am on the create profile page
    When I fill in "First Name" with "Yunbo"
    When I fill in "Last Name with "Liang"
    When I select "Software Systems" from "Select Your Track"
    When I fill in "Expected Graduation Year" with "2021"
    And I click submit
    Then I should be on the audit degree page

Scenario: CS major, Machine Learning track
    When I select "Machine Learning" from "student[track]"
    When I select "Spring 2022" from expected graduation date
    When I select 18 from total credit
    And I click submit
    Then I should be on the audit degree page

Scenario: Business Major, Entrepreneur track
    When I select "Entrepreneur" from track
    When I select "Spring 2022" from expected graduation date
    When I select 8 from total credit
    And I click submit
    Then I should see “Not implemented”

Scenario: Not logged in
    Given I am not logged in
    Then I should redirect to homepage

Scenario: Empty form
    Given I am logged in
    And I click submit
    Then I should see “Error: Please fill in the required fields”
    When I select "Computer Science" from major
    And I click submit
    Then I should see “Error: Please fill in the required fields”
