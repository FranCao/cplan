Feature: View Schedule
    As a student, I wish to plan my schedule for the next semester
    I want to see the listing of all courses for the next semester on the right hand side of the page

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

    Given the following courses exist:
    | id | year | semester | call_number | subject        | course_number | course_identifier | course_name                         | student_id |
    | 1  | 2021 | Summer   | 12483       | COMS           | 4732          | COMS4732          | Computer Vision II: Learning        | 1          |

    Given the following students exist:
    | first_name        | last_name | email                   |track_id | id         |
    | Yunbo             | Liang     | yunboliang@columbia.edu |1        | 1          |
    | leo               | lee       | leolee@columbia.edu     |1        | 2          |
    | Joy               | Li        | joyli@columbia.edu      |1        | 3          |

    Given the following schedules exist:
    | student_id    | courses_offering_id |
    | 1             | 1                   |

    Given the following taken_courses exist:
    | id | student_id    | course_id  |
    | 1  | 1             | 1          |

    Given the following track_requirements exist:
    | id | track_id | course_id | is_general_elective | is_required | is_systems_breadth_requirement        | is_theory_breadth_requirement          | is_aiapplications_breadth_requirement                  |
    | 1  | 1        | 1         | true                | true        | true                                  | true                                   | true                                                   |

Scenario: See all courses for the next semester
    Given I am looking at Liang's schedule
    Then I should see all the courses for the next semester
    And I should not see courses for other semesters