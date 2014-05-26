FactoryGirl.define do

  sequence :company_name do |n|
    "Test company #{n}"
  end

  trait :startup do
    name "Startup company"
    company_type { FactoryGirl.create(:company_type, :startup_type) }
  end

  trait :business do
    name "Business company"
    company_type { FactoryGirl.create(:company_type, :business_type) }
  end

  trait :ong do
    name "Ong company"
    company_type { FactoryGirl.create(:company_type, :ong_type) }
  end

  factory :company do
    name { generate(:company_name) }
    email { generate(:email) }
    website "http://www.testcompany.com"
    location "Buenos Aires, Argentina"
    latitude 0
    longitude 0
    description "Test description"
    category
    company_type
  end
end
