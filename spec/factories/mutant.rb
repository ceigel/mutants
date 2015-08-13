FactoryGirl.define do
  factory :mutant do
    sequence(:name) { |n| "Mutant #{n}" }
    sequence(:capability){|n| "Capability #{n}"}
  end
end

