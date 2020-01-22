FactoryBot.define do
  factory :order do
    merchant { FactoryBot.create :merchant }
    shopper { FactoryBot.create :shopper }
    amount { 20 }

    trait :completed
    completed_at { Date.new(2020, 01, 01) }

  end
end
