
FactoryGirl.define do
  factory :catalogue, :class => Refinery::Catalogues::Catalogue do
    sequence(:author) { |n| "refinery#{n}" }
  end
end

