Feature: Admin Panel
	In order to ensure that the admin panel is working
	As an administrator
	I should be able to access the admin panel
	And I should be able to create companies
	And I should be able to create advertisements

	Scenario: Create companies
		Given I am logged in as an Administrator
		And there are categories
		And I am on the admin_companies page
		And I follow "New Company"
		And I fill in "Name" with "Test Company"
		And I select "Empresa" from "Company type"
		And I select "Test Category 1" from "Category"
		And I fill in "Website" with "www.testcompany.com"
		And I fill in "Location" with "Test Location, Test Country"
		And I fill in "Description" with "Test Description"
		And I press "Create Company"
		Then I should see "Company was successfully created."

	Scenario: Create advertisements
		Given I am logged in as an Administrator
		And there are categories
		And there is a company
		And I am on the admin_advertisements page
		And I follow "New Advertisement"
		And I fill in "Title" with "Test Advertisement"
		And I select "Test Company" from "Company"
		And I select "Test Category 1" from "Category 1"
		And I select "Test Category 2" from "Category 2"
		And I fill in "Description" with "Test Description"
		And I check "Published"
		And I press "Create Advertisement"
		Then I should see "Advertisement was successfully created."
