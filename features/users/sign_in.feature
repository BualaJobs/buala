Feature: Sign in
  In order to have access to protected sections of the site
  As a guest user
  I want to be able to sign in with a previous regitered account

  Background:
    Given I have a registered account
    And I am not logged in

  Scenario: Sign in with valid data
    Given I sign in with valid data
    Then I should see a successful sign in message

  Scenario: Sign in without email
    Given I sign in without an email
    Then I should see an invalid sign in message

  Scenario: Sign in without password
    Given I sign in without a password
    Then I should see an invalid sign in message

  Scenario: Sign in with invalid credentials
    Given I sign in with invalid credentials
    Then I should see an invalid sign in message

  Scenario: Sign out
    Given I sign in with valid data
    And I sign out
    Then I should see a successful sign out message
