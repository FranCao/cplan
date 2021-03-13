Feature: Create Profile
    As a first time user, I need to fill out my profile to proceed to other features

Scenario: CS major, Software systems track
    Given I am logged in 
    When I choose Computer Science from major
    When I choose Software Systems from track
    When I choose Fall 2021 from expected graduation date
    When I choose fill 12 from total credit
    Then I click submit
    Then I should be on the audit degree page

Scenario: CS major, Machine Learning track
    Given I am logged in 
    When I choose Computer Science from major
    When I choose Machine Learning from track
    When I choose Spring 2022 from expected graduation date
    When I choose fill 18 from total credit
    Then I click submit
    Then I should be on the audit degree page

Scenario: Business Major, Entrepreneur track
    Given I am logged in 
    When I choose Business from major
    When I choose Entrepreneur from track
    When I choose Spring 2022 from expected graduation date
    When I choose fill 8 from total credit
    Then I click submit
    Then I should see “Not implemented”

Scenario: Not logged in
    Given I am not logged in
    Then I should be on the login page

Scenario: Empty form
    Given I am logged in 
    When I click submit
    Then I should see “Error: Please fill in the required fields”
    When I choose "Computer Science" from major
    And I click submit
    Then I should see “Error: Please fill in the required fields”
