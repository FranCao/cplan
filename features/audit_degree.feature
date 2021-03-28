Feature: audit degree
	As a user, I need to see everything related to my major/track on this page.

Background:
    Given I am logged in
	Given the following tracks exist:
    |name               | id|
    |Computer Biology   | 1 |
    |Software Systems   | 2 |
    |Machine Learning   | 3 |

    Given the following courses exist:
    | subject        | course_number | course_name                  |
    | COMS           | 4732          | Computer Vision II: Learning |
    | CSOR           | 4231          | ANALYSIS OF ALGORITHMS I     |

    Given the following track_requirements exist:
    | track_id | course_id | is_systems_breadth_requirement | is_theory_breadth_requirement | is_aiapplications_breadth_requirement | is_required | is_general_elective |
    | 1        | COMSW4111 | false                          | true                          | false                                 | false       | true                |

    Given the following students exist:
    | first_name        | last_name | email                   | track_id |
    | Yunbo             | Liang     | yunboliang@columbia.edu | 1        |
    | Yaada             | dodo      | yadaa@columbia.edu 	  | 2        |

Scenario: CS major, Computer Biology track
	Given I am on the audit degree page for "Yunbo"
	Then I should see "Computer Biology"

Scenario: CS major, Software Systems track
	Given I am on the audit degree page for "Yaada"
	Then I should see "Software Systems"