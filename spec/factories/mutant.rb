FactoryGirl.define do
  factory :mutant do
    sequence(:name) { |n| "Mutant #{n}" }
    password "q1w2e3r4"
  end
end

