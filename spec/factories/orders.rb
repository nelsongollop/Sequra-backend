FactoryBot.define do
  factory :order do
    merchant { nil }
    shopper { nil }
    amount { 1.5 }
  end
end
