FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    team factory: :team
  end
end
