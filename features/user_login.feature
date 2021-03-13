Feature: User Login
    If a user is not logged in, they can use single-sign-on to login to LionMail
    Or they can go to their audit page if they are logged in


Scenario: Logging in
    Given I am not logged in
    When I click "Sign in with Lionmail"
    Then I should be on login

Scenario: On courses page
    Given I am on the home page
    Given I am not logged in
    Then I should not see "Log out"

Scenario: Logged In
    When I am logged in
    Then I should be on /
