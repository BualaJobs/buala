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

def visit_advertisement_detail advertisement
  visit advertisement_path advertisement
end

def have_badge badge_img
  have_xpath("//img[@src=\"#{badge_img}\"]")
end

def have_no_badge badge_img
  have_no_xpath("//img[@src=\"#{badge_img}\"]")
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
