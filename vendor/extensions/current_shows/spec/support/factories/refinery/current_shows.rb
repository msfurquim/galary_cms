
FactoryGirl.define do
  factory :current_show, :class => Refinery::CurrentShows::CurrentShow do
    sequence(:caption) { |n| "refinery#{n}" }
  end
end

