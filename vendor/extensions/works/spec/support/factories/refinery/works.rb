
FactoryGirl.define do
  factory :work, :class => Refinery::Works::Work do
    sequence(:caption) { |n| "refinery#{n}" }
  end
end

