Feature: View Schedule
    As a student, I wish to plan my schedule for the next semester
    I want to see the listing of all courses for the next semester on the right hand side of the page
    And I want to add things to my schedule and display it on the calendar

Background:
    Given I am logged in
    Given the following tracks exist:
    | name            | id |
    |Computer Bio     | 1  |
    |Software Systems | 2  |
    |Machine Learning | 3  |

    Given the following courses_offerings exist:
    | subject        | course_number | course_name                         | semester | weekday | start_time_1        | end_time_1          | id                  |
    | COMS           | 4732          | Computer Vision II: Learning        | Summer   | MW      | 2021-05-04 10:10:00 | 2021-05-04 12:40:00 | 1                   |
    | CSOR           | 4231          | ANALYSIS OF ALGORITHMS I            | Summer   | TR      | 2021-05-05 16:10:00 | 2021-05-05 18:40:00 | 2                   |
    | COMS           | 4115          | PROGRAMMING LANGUAGES & TRANSLATORS | Spring   | TR      | 2021-05-05 16:10:00 | 2021-05-05 18:40:00 | 3                   |

    Given the following students exist:
    | first_name        | last_name | email                   |track_id | id         |
    | Yunbo             | Liang     | yunboliang@columbia.edu |1        | 1          |
    | leo               | lee       | leolee@columbia.edu     |1        | 2          |
    | Joy               | Li        | joyli@columbia.edu      |1        | 3          |

    Given the following schedules exist:
    | student_id    | courses_offering_id |
    | 2             | 1                   |
    | 2             | 2                   |

Scenario: See all courses for the next semester
    Given I am looking at Leo's schedule
    Then I should see all the courses for the next semester
    And I should not see courses for other semesters

Scenario: Add a course to my schedule
    Given I am looking at Leo's schedule
    And I don't have "CSOR4231" on my schedule
    Then I should see "Add"
    When I click on "Add" for "ANALYSIS OF ALGORITHMS I"
    Then I have "CSOR4231" on my schedule

Scenario: Delete a course from schedule
    Given I am looking at Leo's schedule
    And I have "COMS4732" on my schedule
    Then I should see "Remove"
    When I click on "Remove" for "Computer Vision II: Learning"
    Then I don't have "COMS4732" on my schedule