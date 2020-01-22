class Disbursement < ApplicationRecord
  belongs_to :merchant

  def self.calculate_weekly_merchant(start_date)
    end_date = start_date + 7.days
    Merchant.all do |merchant|
      orders = merchant.orders.completed.where(completed_at: start_date..end_date)
      total = 0
      orders.each do |order|
        fee = calculate_fee(order.amount)
        total += order.amount * fee
      end
      Disbursement.create!(merchant: merchant, amount: total, start_date: start_date, end_date: end_date)
    end
  end

  def calculate_fee(amount)
    if (1..50).include?(amount)
      0.1
    elsif (50..300).include?(amount)
      0.095
    else
      0.085
    end
  end
end

