require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  let!(:merchant) { FactoryBot.create :merchant, name: "test"}
  let!(:completed_order) { FactoryBot.create :order, :completed, merchant_id: merchant.id }
  let!(:pending_order) { FactoryBot.create :order, :pending }

  context "Weekly calculate function" do
    it "does save completed orders only" do
      Disbursement.calculate_weekly_merchant
      record = Disbursement.find_by(merchant: merchant)

      expect(Disbursement.all.length).to eq(1)
      expect(record.merchant.name).to eq("test")
    end

    it "doesnt save already disbursed orders" do
      Disbursement.create!(order: completed_order, merchant: completed_order.merchant, amount: 10)
      Disbursement.calculate_weekly_merchant
      expect(Disbursement.all.length).to eq(1)
    end

  end

  context "percentatges" do
    it "From 1 to 50" do
      order = FactoryBot.create :order, :completed, amount: 20
      Disbursement.calculate_weekly_merchant

      expect(Disbursement.find(order: order).amount).to eq (20*0.1)
    end

    it "From 50 to 300" do
      order = FactoryBot.create :order, :completed, amount: 60
      Disbursement.calculate_weekly_merchant

      expect(Disbursement.find(order: order).amount).to eq (60*0.095)
    end

    it "300 or more" do
      order = FactoryBot.create :order, :completed, amount: 200
      Disbursement.calculate_weekly_merchant

      expect(Disbursement.find(order: order).amount).to eq (200*0.085)
    end
  end
end
