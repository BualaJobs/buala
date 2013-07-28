FactoryGirl.define do
  
  sequence :degree_name do |n|
    "Test degree #{n}"
  end

  factory :degree do
    name { generate(:degree_name) }
    university
  end
end
