Feature: Badges
  As a guest user
  I should see the badges of an advertisement

  Background:
    Given there are a startup and a business advertisements
    And there are a paid and a not paid advertisements
    And there are advertisements with all the working turns
    And there are advertisements with all the possible start dates
    And there are advertisements with and without vacancies

  Scenario: Startup advertisement
    Given I visit the startup advertisement detail page
    Then I should see the startup badge

  Scenario: Business advertisement
    Given I visit the business advertisement detail page
    Then I should not see a badge for the company type

  Scenario: Paid advertisement
    Given I visit the paid advertisement detail page
    Then I should see the paid badge

  Scenario: Not paid advertisement
    Given I visit the not paid advertisement detail page
    Then I should see the not paid badge

  Scenario: Morning working turn advertisement
    Given I visit the morning working turn advertisement detail page
    Then I should see the morning working turn badge

  Scenario: Afternoon working turn advertisement
    Given I visit the afternoon working turn advertisement detail page
    Then I should see the afternoon working turn badge

  Scenario: Night working turn advertisement
    Given I visit the night working turn advertisement detail page
    Then I should see the night working turn badge

  Scenario: Flexible working turn advertisement
    Given I visit the flexible working turn advertisement detail page
    Then I should see the flexible turn badge

  Scenario: Inmediate start advertisement
    Given I visit the inmediate start advertisement detail page
    Then I should see the inmediate start badge

  Scenario: Start in more than one month advertisement
    Given I visit the more than one month advertisement detail page
    Then I should see the month start badge

  Scenario: Advertisement with no start date
    Given I visit the detail page of an advertisement without a start date
    Then I should see the inmediate start badge

  Scenario: Advertisement with vacancies
    Given I visit the detail page of an advertisement with vacancies
    Then I should see the vacancies badge

  Scenario: Advertisement with no vacancies specified
    Given I visit the detail page of an advertisement with no vacancies specified
    Then I should not see the vacancies badge
