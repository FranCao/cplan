Feature: Audit Degree
	As a user, I need to see tracks requirement I have not completed.

Background:
	Given the following tracks exist:
    |name               | id| number_of_track_electives | number_of_general_electives |
    |Computer Biology   | 1 |                           |                             |
    |Software Systems   | 2 |                           |                             |
    |Machine Learning   | 3 |2                          | 2                           |

    Given the following courses exist:
    | subject        | course_number | course_name                  | id | course_identifier |
    | COMS           | 4732          | Computer Vision II: Learning | 3  | COMS4732          |
    | CSOR           | 4231          | ANALYSIS OF ALGORITHMS I     | 2  | CSOR4231          |
    | COMS           | 4111          | Introduction to Database     | 1  | COMS4111          |

    Given the following track_requirements exist:
    | track_id | course_id | is_systems_breadth_requirement | is_theory_breadth_requirement | is_aiapplications_breadth_requirement | is_required | is_general_elective |
    | 1        | 1         | true                           | false                         | false                                 | false       | false               |
    | 2        | 2         | false                          | true                          | false                                 | false       | false               |
    | 3        | 1         | true                           | false                         | false                                 | true        | false               |

    Given the following students exist:
    | first_name        | last_name | email                   | track_id | id | graduation_year |
    | Yunbo             | Liang     | yunboliang@columbia.edu | 1        | 1  | 2021            |
    | Yaada             | dodo      | yadaa@columbia.edu      | 2        | 2  | 2022            |
    | Ryan              | L         | ryanl@columbia.edu      | 3        | 3  | 2022            |

    Given the following taken_courses exist:
    | id | student_id | course_id |
    | 1  | 1          | 1         |
    | 2  | 2          | 2         |
    | 3  | 3          | 1         |

Scenario: CS major, Computer Biology track
    Given I am student with id 1
	Given I am on the audit degree page for "Yunbo"
	Then I should see "✅ Breadth Requirements System"
    Then I should see "COMS4111 Introduction to Database"
    Then I should see "❌ Breadth Requirements Theory"
    Then I should see "❌ Breadth Requirements AI & Applications"
    Then I should see "✅ Required"
    Then I should see "❌ Track elective"
    Then I should see "❌ General elective"

Scenario: CS major, Software Systems track
    Given I am student with id 2
	Given I am on the audit degree page for "Yaada"
	Then I should see "❌ Breadth Requirements System"
    Then I should see "✅ Breadth Requirements Theory"
    Then I should see "CSOR4231 ANALYSIS OF ALGORITHMS I"
    Then I should see "❌ Breadth Requirements AI & Applications"
    Then I should see "✅ Required"
    Then I should see "❌ Track elective"
    Then I should see "❌ General elective"

Scenario: CS major, Software Systems track
    Given I am student with id 3
	Given I am on the audit degree page for "Ryan"
	Then I should see "✅ Breadth Requirements System"
    Then I should see "❌ Breadth Requirements Theory"
    Then I should see "COMS4111 Introduction to Database"
    Then I should see "❌ Breadth Requirements AI & Applications"
    Then I should see "✅ Required"
    Then I should see "❌ Track elective"
    Then I should see "❌ General elective"