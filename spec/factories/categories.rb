FactoryGirl.define do

  sequence :name do |n|
    "Test category #{n}"
  end
  
  factory :category do
    name
  end
end
