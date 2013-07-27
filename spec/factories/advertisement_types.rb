FactoryGirl.define do

  sequence :advertisement_type_name do |n|
    "Test advertisement type #{n}"
  end

  factory :advertisement_type do
    name { generate(:advertisement_type_name) }
  end
end
