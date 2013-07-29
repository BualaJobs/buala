FactoryGirl.define do

  sequence :company_type_name do |n|
    "Test company type #{n}"
  end

  trait :startup_type do
  	name "Startup"
  end

  trait :business_type do
  	name "Empresa"
  end

  trait :ong_type do 
  	name "Ong"
  end

  factory :company_type do
    name { generate(:company_type_name) }
  end
end
