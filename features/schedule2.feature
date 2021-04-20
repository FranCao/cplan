Feature: Edit Schedule
    I want to add things to my schedule and display it on the calendar

Background:
    Given I am logged in
    Given the following tracks exist:
    | name            | id |
    |Computer Bio     | 1  |
    |Software Systems | 2  |
    |Machine Learning | 3  |

    Given the following courses_offerings exist:
    | subject        | course_number | course_identifier | course_name                         | semester | weekday | start_time_1        | end_time_1          | id                  |
    | COMS           | 4732          | COMS4732          | Computer Vision II: Learning        | Summer   | MW      | 2021-05-04 10:10:00 | 2021-05-04 12:40:00 | 1                   |

    Given the following students exist:
    | first_name        | last_name | email                   |track_id | id         |
    | Yunbo             | Liang     | yunboliang@columbia.edu |1        | 1          |
    | leo               | lee       | leolee@columbia.edu     |1        | 2          |
    | Joy               | Li        | joyli@columbia.edu      |1        | 3          |

    Given the following schedules exist:
    | student_id    | courses_offering_id |
    | 1             | 1                   |

Scenario: Add a course to my schedule
    Given I am looking at Liang's schedule
    And I don't have "COMS4732" on my schedule
    Then I should see "Add"
    When I click on "Add" for "Computer Vision II: Learning"
    And I click "Add"
    Then I have "COMS4732" on my schedule
    And I am looking at Liang's schedule

Scenario: Delete a course from schedule
    Given I am looking at Liang's schedule
    And I have "COMS4732" on my schedule
    Then I should see "Remove"
    When I click on "Remove" for "Computer Vision II: Learning"
    And I click "Remove"
    Then I don't have "COMS4732" on my schedule
    And I am looking at Liang's schedule