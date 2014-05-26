FactoryGirl.define do
  sequence :email do |n|
    "test-#{n}@buala-test.com"
  end
end