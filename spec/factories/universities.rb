FactoryGirl.define do

  sequence :university_name do |n|
    "Test university #{n}"
  end

  factory :university do
    name { generate(:university_name) }
  end
end
