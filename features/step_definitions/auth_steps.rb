require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def get_user_data
  @user_data ||= { name: 'Test user', email: 'example@example.com', password: '123123123',
    password_confirmation: '123123123', university: @university.name, degree: @degree.name }
end

def sign_up user_data
  visit '/users/sign_up'
  fill_in 'Name', with: user_data[:name]
  fill_in 'Email', with: user_data[:email]
  fill_in 'Password', with: user_data[:password]
  fill_in 'Password confirmation', with: user_data[:password_confirmation]
  select user_data[:university], from: 'University'
  select user_data[:degree], from: 'Degree'
  click_button 'Sign up'
end

def sign_up_replacing key, value
  user_data = get_user_data
  user_data[key] = value
  sign_up user_data
end

def sign_up_without key
  sign_up_replacing key, ''
end

# Background

Given(/^there is a university$/) do
  @university ||= FactoryGirl.create(:university)
end

Given(/^there is a degree$/) do
  @degree ||= FactoryGirl.create(:degree)
end

Given(/^I am not logged in$/) do
  page.driver.submit :delete, '/users/sign_out', {}
end

# Sign up

When(/^I sign up with valid user data$/) do
  sign_up get_user_data
end

Then(/^I should see a successful sign up message$/) do
  page.should have_content 'Welcome! You have signed up successfully.'
end

When(/^I sign up with an invalid email$/) do
  sign_up_replacing :email, 'invalid.email'
end

Then(/^I should see an invalid email message$/) do
  page.should have_content 'Email is invalid'
end

When(/^I sign up without a password$/) do
  user_data = get_user_data
  user_data[:password] = ''
  user_data[:password_confirmation] = ''
  sign_up user_data
end

Then(/^I should see a missing password message$/) do
  page.should have_content 'Password can\'t be blank'
end

When(/^I sign up without a password confirmation$/) do
  sign_up_without :password_confirmation
end

Then(/^I should see a missing password confirmation message$/) do
  page.should have_content 'Password doesn\'t match confirmation'
end

When(/^I sign up with a mismatched password confirmation$/) do
  sign_up_replacing :password_confirmation, '321321321'
end

Then(/^I should see a mismatched password message$/) do
  page.should have_content 'Password doesn\'t match confirmation'
end
