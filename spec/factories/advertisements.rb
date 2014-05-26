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

  trait :starting_tomorrow do
    start_date { Date.today + 1.days }
  end

  trait :starting_month do
    start_date { Date.today + 1.months + 1.days }
  end

  trait :no_starting_date do
    start_date { nil }
  end

  trait :with_vacancies do
    vacancies 10
  end

  trait :without_vacancies do
    vacancies 0
  end

  factory :advertisement do
    title "Test advertisement"
    description "Test description"
    short_description "This is the short description"
    company
    published true
    association :category_1, factory: :category
    association :advertisement_type, factory: :advertisement_type
    is_paid true
    working_turn
    start_date { Date.today + 5.days }
    vacancies 2
  end

end
