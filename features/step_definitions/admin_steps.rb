require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def create_admin
  @admin ||= AdminUser.create email: 'admin@example.com', password: '123123123', 
    password_confirmation: '123123123'
end

def delete_admin
  AdminUser.destroy_all
end

Given(/^there is a company$/) do
  FactoryGirl.create(:company)
end

Given(/^there is a company type$/) do
  FactoryGirl.create(:company_type)
end

Given(/^there is a category$/) do
  FactoryGirl.create(:category)
end

Given(/^there are categories$/) do
  Category.create name: "Test Category 1"
  Category.create name: "Test Category 2"
end

Given(/^I am logged in as an Administrator$/) do
  create_admin
  visit "/admin"
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_button "Login"
end
