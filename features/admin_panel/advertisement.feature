Feature: Administrating advertisements
  In order to administrate the advertisements
  I want to be able to create advertisements
  I want to be able to edit advertisements
  I want to be able to delete advertisements

  Background:
    Given there exist a company
    And there are two different categories
    And I am logged in as an Administrator

  Scenario: Create an advertisement with valid data
    Given I create an advertisement with valid data
    Then I should see a successful created advertisement message

  Scenario: Create an advertisement without a title
    Given I create an advertisement without a title
    Then I should see an invalid value provided message

  Scenario: Create an advertisement without a company
    Given I create an advertisement without a company
    Then I should see an invalid value provided message

  Scenario: Create an advertisement with repeated categories
    Given I create an advertisement with repeated categories
    Then I should see an invalid categories selection message

  Scenario: Create an advertisement without a description
    Given I create an advertisement without a description
    Then I should see an invalid value provided message