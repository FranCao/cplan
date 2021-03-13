Feature: User Login
    If a user is not logged in, they can use single-sign-on to login to LionMail
    Or they can go to their audit page if they are logged in

Background:
    Given I am on the homepage
    And a student named "Adam Smith"

Scenario: Logging in
    Given I am not logged in
    When I click "Sign in with Lionmail"
    Then I should redirect to single sign on page

Scenario: Already logged in
    Given I am logged in
    Then I should not see “Sign in with LionMail”
    And I should see “Adam Smith”

Scenario: First time user log in
    Given I am logged in
    Then I should be on Create Profile page

Scenario: Normal user log in
    Given I am logged in
    Then I should be on Audit Degree page

Scenario: Menu Options
    Given I am logged in
    Then I should be able to click my username on the top right
    And I should see “Home”
    And I should see “Schedule”
    And I should see “Log out”

