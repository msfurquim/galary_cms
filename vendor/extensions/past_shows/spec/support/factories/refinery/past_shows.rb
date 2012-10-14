
FactoryGirl.define do
  factory :past_show, :class => Refinery::PastShows::PastShow do
    sequence(:year) { |n| "refinery#{n}" }
  end
end

