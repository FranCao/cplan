Feature: Admin Courses View
    As an admin, I can see all the courses offered at Columbia
    I can edit existing course details
    And I can add new courses for students

Background:
    Given I am an admin and logged in
    Given the following courses exist:
    | subject        | course_number | course_name                  | id | course_identifier |
    | COMS           | 4732          | Computer Vision II: Learning | 1  | COMSW4732          |

    Given the following students exist:
    |id| first_name        | last_name | email                   | is_admin |
    |1 | Frances           | Cao       | fc@columbia.edu         | 1        |

Scenario: Admin Portal for Courses
    Given I am on the admin page
    Then I should see "Admin Update Course Portal"
    And I should see "Course Identifier"
    And I should see "Course Name"
    And I should see "Call Number"

Scenario: Edit existing course and update course name
    Given I am on the admin page
    When I click "Edit"
    Then I will be on the edit courses page for COMSW4732
    Then I should see "Edit Course COMSW4732"
    When I fill in "Course Name" with "Comp Vision"
    And I press "Update Course Info"
    Then I should be on the admin page
    And I should see "Comp Vision"

Scenario: Edit existing course and cancel changes
    Given I am on the admin page
    When I click "Edit"
    Then I will be on the edit courses page for COMSW4732
    Then I should see "Edit Course COMSW4732"
    When I fill in "Course Name" with "Comp Vision"
    And I click "Cancel"
    Then I should be on the admin page
    And I should not see "Comp Vision"

Scenario: Add new course as an admin
    Given I am on the admin page
    And there are no existing courses
    When I click "Add new course"
    Then I will be on the add courses page
    When I fill in "Course Name" with "ANALYSIS OF ALGORITHMS I"
    And I fill in "Call Number" with "66666"
    And I fill in "Course Number" with "4231"
    And I fill in "Course Identifier" with "CSORW4231"
    And I press "Save Changes"
    Then I should be on the admin page
    And I should see "NALYSIS OF ALGORITHMS I"
