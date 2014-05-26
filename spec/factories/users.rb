FactoryGirl.define do
  
  factory :user do
    fullname 'Test user'
    email
    password '123123123'
    password_confirmation '123123123'
  end

end
