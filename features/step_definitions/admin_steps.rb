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

def get_advertisement_data
  @advertisement_data ||= { title: 'Test advertisement', advertisement_type: @advertisement_type.name, 
    company: @created_company.name, category_1: @categories.first.name, category_2: @categories.second.name, 
    description: 'Test description', published: true, is_paid: true, working_turn: @working_turn.name }
end

def create_advertisement advertisement_data
  visit '/admin/advertisements'
  click_link 'New Advertisement'
  fill_in 'Title', with: advertisement_data[:title]
  select advertisement_data[:advertisement_type], from: 'Advertisement type'
  select advertisement_data[:company], from: 'Company'
  select advertisement_data[:category_1], from: 'Category 1'
  select advertisement_data[:category_2], from: 'Category 2'
  fill_in 'Description', with: advertisement_data[:description]
  check 'Published' if advertisement_data[:published]
  uncheck 'Published' unless advertisement_data[:published]
  check 'Is paid' if advertisement_data[:is_paid]
  select advertisement_data[:working_turn], from: 'Working turn'
  click_button 'Create Advertisement'
end

def create_advertisement_without value
  advertisement_data = get_advertisement_data
  advertisement_data[value] = ''
  create_advertisement advertisement_data
end

# Background

Given(/^there exist a company type$/) do
  @company_type ||= FactoryGirl.create(:company_type)
end

Given(/^there exist a category$/) do
  @category ||= FactoryGirl.create(:category)
end

Given(/^there are two different categories$/) do
  @categories ||= FactoryGirl.create_list(:category, 2)
end

Given(/^there is an advertisement type$/) do
  @advertisement_type ||= FactoryGirl.create(:advertisement_type)
end

Given(/^there is a working turn$/) do
  @working_turn ||= FactoryGirl.create(:working_turn)
end

# Utils

Then(/^debugging$/) do
  binding.pry
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

# Create advertisement

Given(/^there exist a company$/) do
  @created_company = FactoryGirl.create(:company)
end

Given(/^I create an advertisement with valid data$/) do
  create_advertisement get_advertisement_data
end

Then(/^I should see a successful created advertisement message$/) do
  page.should have_content 'Advertisement was successfully created.'
end

Given(/^I create an advertisement without a title$/) do
  create_advertisement_without :title
end

Given(/^I create an advertisement without a company$/) do
  create_advertisement_without :company
end

Given(/^I create an advertisement with repeated categories$/) do
  advertisement_data = get_advertisement_data
  advertisement_data[:category_2] = advertisement_data[:category_1]
  create_advertisement advertisement_data
end

Then(/^I should see an invalid categories selection message$/) do
  page.should have_content 'Categories should be different'
end

Given(/^I create an advertisement without a description$/) do
  create_advertisement_without :description
end
