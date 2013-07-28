Feature: Published events
  As a guest user
  I should see only published advertisments

  Background:
    Given there is a published advertisment
    And there is an unpublished advertisment

  Scenario: Recommended advertisments should show only published ones
    Given I am on the homepage
    Then I should see "Published advertisement"
    And I should not see "Not published advertisement"

  Scenario: Access to published advertisements
    Given I am on the published advertisement detail page
    Then I should see "Published advertisement"

  Scenario: No access to published advertisements
    Given I am on the not published advertisement detail page
    Then I should obtain a 404 error