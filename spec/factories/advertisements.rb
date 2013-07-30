FactoryGirl.define do

  trait :published do
    title "Published advertisement"
    published true
  end

  trait :not_published do
    title "Not published advertisement"
    published false
  end

  trait :startup_company do
    company { FactoryGirl.create(:company, :startup) }
  end

  trait :business_company do
    company { FactoryGirl.create(:company, :business) }
  end

  trait :paid do
    is_paid true
  end

  trait :not_paid do
    is_paid false
  end

  trait :morning do
    working_turn { FactoryGirl.create(:working_turn, :morning_working_turn) }
  end

  trait :afternoon do
    working_turn { FactoryGirl.create(:working_turn, :afternoon_working_turn) }
  end

  trait :night do
    working_turn { FactoryGirl.create(:working_turn, :night_working_turn) }
  end

  trait :flexible do
    working_turn { FactoryGirl.create(:working_turn, :flexible_working_turn) }
  end

  factory :advertisement do
    title "Test advertisement"
    description "Test description"
    company
    published true
    association :category_1, factory: :category
    association :category_2, factory: :category
    association :advertisement_type, factory: :advertisement_type
    is_paid true
    working_turn
  end

end
