Feature: Badges
  As a guest user
  I should see the badges of an advertisement

  Background:
    Given there are a startup and a business advertisements

  Scenario: Startup advertisement
    Given I visit the startup advertisement detail page
    Then I should see the startup badge

  Scenario: Business advertisement
    Given I visit the business advertisement detail page
    Then I should not see a badge for the company type
