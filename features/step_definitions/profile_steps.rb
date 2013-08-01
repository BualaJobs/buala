require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def get_user_data
  @university ||= FactoryGirl.create(:university)
  @degree ||= FactoryGirl.create(:degree) 
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

def my_profile
  visit '/'
  click_link 'MI PERFIL'
end

Given(/^There is a registered account$/) do
  user_data = get_user_data
  sign_up user_data
end

Given(/^I navigate to my profile page$/) do
  my_profile
end

Then(/^I should see my profile$/) do
  user_data = get_user_data
  page.should have_content 'Mi Perfil'
  page.should have_content user_data[:name]
  page.should have_content user_data[:email]
end