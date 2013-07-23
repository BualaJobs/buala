require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^I am logged in as an Administrator$/) do
	visit "/admin"
	fill_in "Email", with: "admin@bualajobs.com"
	fill_in "Password", with: "123123123"
	click_button "Login"
end