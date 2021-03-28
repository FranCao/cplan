Feature: Homepage View
    As a new user, I want to see what the homepage looks like
    So that I can login and start planning

Scenario: Seeing the homepage for CPlan
    Given I am on the home page
    Given I am not logged in
    Then I should see the CPlan logo
    And I should see “Sign in”
    And I should see “Start Planning”
    And I should see a Columbia University logo