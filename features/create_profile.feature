Feature: Create Profile
    As a first time user, I need to fill out my profile to proceed to other features
    If I am not logged in, I should redirect to homepage

Background: 
    Given I am logged in
    Given the following tracks exist:
    |name            | id|
    | computer bio   | 1 |
    |Software Systems| 2 |
    |Machine Learning|3  |

    Given the following students exist:
    | first_name        | last_name | email                   | track_id |
    | Yunbo             | Liang     | yunboliang@columbia.edu | 1        |
    | leo               | lee       | leolee@columbia.edu     | 1        |
    | Joy               | Li        | joyli@columbia.edu      | 1        |
    Given the following courses exist:
    | subject        | course_number | course_name                  |
    | COMS           | 4732          | Computer Vision II: Learning |
    | CSOR           | 4231          | ANALYSIS OF ALGORITHMS I     |

Scenario: CS major, Software systems track
    Given I am on the create profile page for "Yunbo"
    When I select "Software Systems" from "Select Your Track"
    When I fill in "Expected Graduation Year" with "2023"
    When I select "Fall" from "Expected Graduation Semester"
    And I press "Submit"
    Then I should be on the audit degree page for "Yunbo"
    And I should see "2023"
    And I should see "Yunbo"

Scenario: CS major, Machine Learning track
    Given I am on the create profile page for "leo"
    When I select "Machine Learning" from "Select Your Track"
    When I fill in "Expected Graduation Year" with "2022"
    When I select "Spring" from "Expected Graduation Semester"
    And I press "Submit"
    Then I should be on the audit degree page for "leo"
    And I should see "2022"
    And I should see "leo"

Scenario: Add courses should show up in both edit profile and show profile page
    Given I am on the create profile page for "Yunbo"
    Then I should see "Courses Taken"
    When I select "COMS 4732 Computer Vision II: Learning" from "Courses Taken"
    And I press "Add"
    Then I should be on the create profile page for "Yunbo"
    And I should see "COMS 4732 Computer Vision II: Learning"
    When I follow "Cancel"
    Then I should be on the audit degree page for "Yunbo" 
    And I should see "COMS 4732 Computer Vision II: Learning"

Scenario: Remove courses
    Given I am on the create profile page for "Yunbo"
    When I select "COMS 4732 Computer Vision II: Learning" from "Courses Taken"
    And I press "Add"
    Then I should be on the create profile page for "Yunbo"
    And I should see "COMS 4732 Computer Vision II: Learning"
    When I click remove after "4732"
    Then I should be on the create profile page for "Yunbo"
    And I should not see "COMS 4732 Computer Vision II: Learning" in the table
    When I select "Machine Learning" from "Select Your Track"
    When I fill in "Expected Graduation Year" with "2022"
    When I select "Spring" from "Expected Graduation Semester"
    And I press "Submit"
    Then I should be on the audit degree page for "Yunbo" 
    And I should not see "COMS 4732 Computer Vision II: Learning"
