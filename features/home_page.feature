Feature: Homepage View
    As a new user, I want to see what the homepage looks like
    So that I can login

Scenario: Seeing the homepage for a new Rails project
    Given I am on the home page
    Then I should see the CPlan logo
    And I should see “Sign in”
    And I should see “Start Planning”
    And I should see an image of the school as the background
    And I should see a Columbia University logo