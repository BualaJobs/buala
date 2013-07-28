FactoryGirl.define do

  sequence :company_name do |n|
    "Test company #{n}"
  end

  factory :company do
    name { generate(:company_name) }
    website "http://www.testcompany.com"
    location "Test Location, Test Country"
    description "Test description"
    category
    company_type
  end
end
