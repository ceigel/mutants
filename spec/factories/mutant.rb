FactoryGirl.define do
  factory :mutant do
    sequence(:name) { |n| "Mutant #{n}" }
    password "q1w2e3r4"

    trait :admin do
      sequence(:name) { |n| "Admin #{n}"}
    end
  end
end

