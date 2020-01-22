class Disbursement < ApplicationRecord
  belongs_to :merchant
  belongs_to :order

  def self.calculate_weekly_merchant
    orders = Order.completed.not_disbursed
    orders.each do |order|
      fee = calculate_fee(order.amount)
      total = order.amount * fee
      Disbursement.create!(order: order, merchant: order.merchant, amount: total)
    end
  end

  def self.calculate_fee(amount)
    if (1..50).include?(amount)
      0.1
    elsif (50..300).include?(amount)
      0.095
    else
      0.085
    end
  end
end

