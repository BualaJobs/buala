require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def create_published_advertisement
  @published_advertisement ||= FactoryGirl.create(:advertisement, :published)
end

def create_not_published_advertisement
  @not_published_advertisement ||= FactoryGirl.create(:advertisement, :not_published)
end

def create_startup_advertisement
  @startup_advertisement ||= FactoryGirl.create(:advertisement, :startup_company)
end

def create_business_advertisement
  @business_advertisement ||= FactoryGirl.create(:advertisement, :business_company)
end

def create_paid_advertisement
  @paid_advertisement ||= FactoryGirl.create(:advertisement, :paid)
end

def create_not_paid_advertisement
  @not_paid_advertisement ||= FactoryGirl.create(:advertisement, :not_paid)
end

def create_morning_advertisement
  @morning_advertisement ||= FactoryGirl.create(:advertisement, :morning)
end

def create_afternoon_advertisement
  @afternoon_advertisement ||= FactoryGirl.create(:advertisement, :afternoon)
end

def create_night_advertisement
  @night_advertisement ||= FactoryGirl.create(:advertisement, :night)
end

def create_flexible_advertisement
  @flexible_advertisement ||= FactoryGirl.create(:advertisement, :flexible)
end

def visit_advertisement_detail advertisement
  visit advertisement_path advertisement
end

def have_badge badge_img
  have_xpath("//img[@src=\"#{badge_img}\"]")
end

def have_no_badge badge_img
  have_no_xpath("//img[@src=\"#{badge_img}\"]")
end

def create_advertisement_starting_tomorrow
  @starting_tomorrow_advertisement ||= FactoryGirl.create(:advertisement, :starting_tomorrow)
end

def create_advertisement_starting_in_one_month
  @starting_month_advertisement ||= FactoryGirl.create(:advertisement, :starting_month)
end

def create_advertisement_without_start_date
  @no_start_advertisement ||= FactoryGirl.create(:advertisement, :no_starting_date)
end

# Background

Given(/^there is a published advertisment$/) do
  create_published_advertisement
end

Given(/^there is an unpublished advertisment$/) do
  create_not_published_advertisement
end

Given(/^there are a startup and a business advertisements$/) do
  create_startup_advertisement
  create_business_advertisement
end

Given(/^there are a paid and a not paid advertisements$/) do
  create_paid_advertisement
  create_not_paid_advertisement
end

Given(/^there are advertisements with all the working turns$/) do
  create_morning_advertisement
  create_afternoon_advertisement
  create_night_advertisement
  create_flexible_advertisement
end

Given(/^there are advertisement with all the possible start dates$/) do
  create_advertisement_starting_tomorrow
  create_advertisement_starting_in_one_month
  create_advertisement_without_start_date
end

# Published

Given(/^I visit the published advertisement detail page$/) do
  visit_advertisement_detail @published_advertisement
end

Given(/^I visit the not published advertisement detail page$/) do
  visit_advertisement_detail @not_published_advertisement
end

# Badges

Given(/^I visit the startup advertisement detail page$/) do
  visit_advertisement_detail @startup_advertisement
end

Given(/^I visit the business advertisement detail page$/) do
  visit_advertisement_detail @business_advertisement
end

Then(/^I should see the startup badge$/) do
  page.should have_badge '/img/nav_icon4.jpg'
  page.should have_content 'Startup'
end

Then(/^I should not see a badge for the company type$/) do
  page.should have_no_badge '/img/nav_icon4.jpg'
end

Given(/^I visit the paid advertisement detail page$/) do
  visit_advertisement_detail @paid_advertisement
end

Given(/^I visit the not paid advertisement detail page$/) do
  visit_advertisement_detail @not_paid_advertisement
end

Then(/^I should see the paid badge$/) do
  page.should have_content 'Remunerada'
end

Then(/^I should see the not paid badge$/) do
  page.should have_content 'No remunerada'
end

Given(/^I visit the morning working turn advertisement detail page$/) do
  visit_advertisement_detail @morning_advertisement
end

Then(/^I should see the morning working turn badge$/) do
  page.should have_badge '/img/nav_icon6.jpg'
  page.should have_content @morning_advertisement.working_turn.name
end

Given(/^I visit the afternoon working turn advertisement detail page$/) do
  visit_advertisement_detail @afternoon_advertisement
end

Then(/^I should see the afternoon working turn badge$/) do
  page.should have_badge '/img/nav_icon6.jpg'
  page.should have_content @afternoon_advertisement.working_turn.name
end

Given(/^I visit the night working turn advertisement detail page$/) do
  visit_advertisement_detail @night_advertisement
end

Then(/^I should see the night working turn badge$/) do
  page.should have_badge '/img/nav_icon6.jpg'
  page.should have_content @night_advertisement.working_turn.name
end

Given(/^I visit the flexible working turn advertisement detail page$/) do
  visit_advertisement_detail @flexible_advertisement
end

Then(/^I should see the flexible turn badge$/) do
  page.should have_badge '/img/nav_icon6.jpg'
  page.should have_content @flexible_advertisement.working_turn.name
end

Given(/^I visit the inmediate start advertisement detail page$/) do
  visit_advertisement_detail @starting_tomorrow_advertisement
end

Then(/^I should see the inmediate start badge$/) do
  page.should have_badge '/img/nav_icon3.jpg'
  page.should have_content 'Inmediata'
end

Given(/^I visit the more than one month advertisement detail page$/) do
  visit_advertisement_detail @starting_month_advertisement
end

Then(/^I should see the month start badge$/) do
  page.should have_badge '/img/nav_icon3.jpg'
  page.should have_content (I18n.l @starting_month_advertisement.start_date, format: '%B, %Y').humanize
end

Given(/^I visit the detail page of an advertisement without a start date$/) do
  visit_advertisement_detail @no_start_advertisement
end
