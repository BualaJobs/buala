Feature: Administrating companies
  In order to administrate the companies
  I want to be able to create companies
  I want to be able to edit companies
  I want to be able to delete companies

  Background:
    Given there exist a company type
    And there exist a category
    And I am logged in as an Administrator

  Scenario: Create a company with valid data
    Given I create a company with valid data
    Then I should see a successful created company message

  Scenario: Create a company without a name
    Given I create a company without a name
    Then I should see an invalid value provided message

  Scenario: Create a company without selecting a type
    Given I create a company without selecting the type
    Then I should see an invalid value provided message

  Scenario: Create a company without selecting a category
    Given I create a company without selecting a category
    Then I should see an invalid value provided message

  Scenario: Create a company without a description
    Given I create a company without a description
    Then I should see an invalid value provided message
