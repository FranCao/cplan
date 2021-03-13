Feature: User Login
    If a user is not logged in, they can use single-sign-on to login to LionMail
    Or they can go to their audit page if they are logged in

Background:
    Given I am on the home page
    And a student named "Adam Smith"

Scenario: Logging in
    Given I am not logged in
    When I click "Sign in with Lionmail"
    Then I should be on login page

Scenario: On courses page
    Given I am not logged in
    When I am on courses page
    Then I should be on login page

Scenario: Logged In
    When I am logged in
    Then I should be on home page

Scenario: Menu Options
    Given I am logged in
    Then I should be able to click on "Adam Smith"
    And I should see “Home”
    And I should see “Schedule”
    And I should see “Log out”