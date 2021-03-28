Feature: View Schedule
    As a student, I wish to plan my schedule for the next semester
    I want to see the listing of all courses for the next semester on the right hand side of the page
    And I want to add things to my schedule and display it on the calendar

Background:
    Given I am logged in
    Given the following courses exist:
    | subject        | course_number | course_name                  |
    | COMS           | 4732          | Computer Vision II: Learning |
    | CSOR           | 4231          | ANALYSIS OF ALGORITHMS I     |
    Given the following students exist:
    | first_name        | last_name | email                   |
    | Yunbo             | Liang     | yunboliang@columbia.edu |
    | leo               | lee       | leolee@columbia.edu     |
    | Joy               | Li        | joyli@columbia.edu      |

Scenario: See all courses for the next semester
    Given I am on the schedule page for "leo"
    Then I should see all the courses for the next semester
    And I should not see courses for other semesters

Scenario: Add a course to my schedule
    Given I am on the schedule page for "leo"
    And I don't have "CSOR4231" on my schedule
    Then I should see "Add"
    When I click on "Add" for "ANALYSIS OF ALGORITHMS I"
    Then I should see "CSOR4231" on the calendar

Scenario: Delete a course from schedule
    Given I am on the schedule page for "Joy"
    And I have "COMS4732" on my schedule
    Then I should see "Remove"
    When I click on "Remove" for "Computer Vision II: Learning"
    Then I should not see "COMS4732" on the calendar