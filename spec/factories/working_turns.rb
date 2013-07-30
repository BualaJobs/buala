FactoryGirl.define do

  sequence :working_turn_name do |n|
    "Working Turn #{n}"
  end

  trait :morning_working_turn do
    name "Turno manana"
  end

  trait :afternoon_working_turn do
    name "Turno tarde"
  end

  trait :night_working_turn do
    name "Turno noche"
  end

  trait :flexible_working_turn do
    name "Horario flexible"
  end

  factory :working_turn do
    name { generate(:working_turn_name) }
  end

end
