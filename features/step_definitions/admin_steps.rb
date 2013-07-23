Given(/^there is a compnay$/) do
	Company.create name: "Test Company", website: "www.testcompany.com", location: "Test Location", description: "Test Description"
end
