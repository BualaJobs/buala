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

  factory :advertisement do
    title "Test advertisement"
    description "Test description"
    company
    published true
    association :category_1, factory: :category
    association :category_2, factory: :category
    association :advertisement_type, factory: :advertisement_type
  end

end
