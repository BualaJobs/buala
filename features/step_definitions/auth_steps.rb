require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def get_user_data
  @university ||= FactoryGirl.create(:university)
  @degree ||= FactoryGirl.create(:degree) 
  @user_data ||= { name: 'Test user', email: 'example@example.com', password: '123123123',
    password_confirmation: '123123123', university: @university.name, degree: @degree.name }
end

def replace_user_data_value key, value
  user_data = get_user_data
  user_data[key] = value
  user_data
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
  sign_up replace_user_data_value key, value
end

def sign_up_without key
  sign_up_replacing key, ''
end

def sign_in user_data
  visit '/users/sign_in'
  fill_in 'Email', with: user_data[:email]
  fill_in 'Password', with: user_data[:password]
  click_button 'Sign in'
end

def sign_in_replacing key, value
  sign_in replace_user_data_value key, value
end

def sign_in_without key
  sign_in replace_user_data_value key, ''
end

# Background

Given(/^I am not logged in$/) do
  page.driver.submit :delete, '/users/sign_out', {}
end

Given(/^I have a registered account$/) do
  user_data = get_user_data
  sign_up user_data
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

# Sign in

Given(/^I sign in with valid data$/) do
  sign_in get_user_data
end

Then(/^I should see a successful sign in message$/) do
  page.should have_content 'Signed in successfully.'
end

Given(/^I sign in without an email$/) do
  sign_in_without :email
end

Then(/^I should see an invalid sign in message$/) do
  page.should have_content 'Invalid email or password.'
end

Given(/^I sign in without a password$/) do
  sign_in_without :password
end

Given(/^I sign in with invalid credentials$/) do
  sign_in_replacing :password, get_user_data[:password].reverse
end
