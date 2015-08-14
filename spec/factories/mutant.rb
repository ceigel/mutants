FactoryGirl.define do
  factory :mutant do
    sequence(:name) { |n| "Mutant #{n}" }
  end
end

