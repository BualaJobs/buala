Feature: My Profile
In order to see your profile information
  As a logged user
  I want to be able to see my profile but not other's profile

  Background:
    Given There are two registered accounts
    Given One of them is logged in

  Scenario: Access your profile
    Given I navigate to my profile page
    Then I should see my profile
    And I should see my name
    And I should see my email

 Scenario: Access another profile
 	Given I navigate to someone's profile page
 	Then I should see a forbidden message

 Scenario: Access my profile after signing out
 	Given I sign out
 	And I navigate to my profile page
 	Then I should see a forbidden message