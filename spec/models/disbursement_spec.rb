require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  let(:merchant) { FactoryBot.create :merchant, name: "test" }
  FactoryBot.create :order, :completed
  FactoryBot.create :order

  context "Weekly calculate" do

    it "does save completed orders only" do
      Disbursement.calculate_weekly_merchant(Date.new(2020, 1, 1))
      record = Disbursement.find_by(merchant: :merchant)

      expect(Disbursement.all.length).to eq(1)
      expect(record.merchant.name).to eq("test")
    end
  end
end
