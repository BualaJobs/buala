Feature: My Profile
In order to see your profile information
  As a regular user
  I want to be able to see my profile

  Background:
    Given There is a registered account

  Scenario: Access your profile
    Given I navigate to my profile page
    Then I should see my profile