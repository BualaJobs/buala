require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^there is a published advertisment$/) do
  FactoryGirl.create(:advertisement, :published)
end

Given(/^there is an unpublished advertisment$/) do
  FactoryGirl.create(:advertisement, :not_published)
end
