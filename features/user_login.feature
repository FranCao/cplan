Feature: User Login
    If a user is not logged in, they can use single-sign-on to login to LionMail
    Or they can go to their audit page if they are logged in

Background:
    Given the following tracks exist:
    |name             | id |
    |Computer Biology | 1  |
    |Software Systems | 2  |
    |Machine Learning | 3  |

@javascript
Scenario: Logging in when I am on the homepage
    Given I am on the home page
    Given I am not logged in
    When I click "Start Planning"
    Then I should redirect to Google Authentication

Scenario: What I should see on the homepage if I am not logged in
    Given I am on the home page
    Given I am not logged in
    Then I should not see "Log out"

Scenario: What happens after I log in
    Given I am on the home page
    When I am logged in
    Then I should redirect to Audit Degree
