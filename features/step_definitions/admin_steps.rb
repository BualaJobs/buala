require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def create_admin
  @admin ||= AdminUser.create email: 'admin@example.com', password: '123123123', 
    password_confirmation: '123123123'
end

def delete_admin
  AdminUser.destroy_all
end

def get_company_data
  @company_data ||= { name: 'Test Company', company_type: @company_type.name, category: @category.name, 
    website: 'www.testcompany.com', location: 'Test Location, Test Country', description: 'Test description' }
end

def create_company company_data
  visit '/admin/companies'
  click_link 'New Company'
  fill_in 'Name', with: company_data[:name]
  select company_data[:company_type], from: 'Company type'
  select company_data[:category], from: 'Category'
  fill_in 'Website', with: company_data[:website]
  fill_in 'Location', with: company_data[:location]
  fill_in 'Description', with: company_data[:description]
  click_button 'Create Company' 
end

def create_company_without value
  company_data = get_company_data
  company_data[value] = ''
  create_company company_data
end

# Background

Given(/^there exist a company type$/) do
  @company_type ||= FactoryGirl.create(:company_type)
end

Given(/^there exist a category$/) do
  @category ||= FactoryGirl.create(:category)
end

# Admin authentication

Given(/^I am logged in as an Administrator$/) do
  create_admin
  visit "/admin"
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_button "Login"
end

# Create company

Given(/^I create a company with valid data$/) do
  create_company get_company_data
end

Then(/^I should see a successful created company message$/) do
  page.should have_content 'Company was successfully created.'
end

Given(/^I create a company without a name$/) do
  create_company_without :name
end

Then(/^I should see an invalid value provided message$/) do
  page.should have_content 'can\'t be blank'
end

Given(/^I create a company without selecting the type$/) do
  create_company_without :company_type
end

Given(/^I create a company without selecting a category$/) do
  create_company_without :category
end

Given(/^I create a company without a description$/) do
  create_company_without :description
end
