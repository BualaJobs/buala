FactoryGirl.define do

  sequence :category_name do |n|
    "Test category #{n}"
  end
  
  factory :category do
    name { generate(:category_name) }
  end
  
end
