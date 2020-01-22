FactoryBot.define do
  factory :disbursement do
    merchant { FactoryBot.create :merchant }
    amount { 20 }
    start_date { "2020-01-22" }
    end_date { "2020-01-22" }
  end
end
