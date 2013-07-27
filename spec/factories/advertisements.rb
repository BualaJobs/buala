FactoryGirl.define do
  factory :advertisement do
    title "Test advertisement"
    description "Test description"
    company
    published true
    association :category_1, factory: :category
    association :category_2, factory: :category
  end
end
