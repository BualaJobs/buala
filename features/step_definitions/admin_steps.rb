Given(/^there is a company$/) do
	Company.create name: "Test Company", company_type: CompanyType.find(1), category: Category.find(1), website: "www.testcompany.com", location: "Test Location", description: "Test Description"
end

Given(/^there are categories$/) do
	Category.create name: "Test Category 1"
	Category.create name: "Test Category 2"
end
