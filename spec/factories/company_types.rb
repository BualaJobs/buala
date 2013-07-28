FactoryGirl.define do

  sequence :company_type_name do |n|
    "Test company type #{n}"
  end

  factory :company_type do
    name { generate(:company_type_name) }
  end
end
