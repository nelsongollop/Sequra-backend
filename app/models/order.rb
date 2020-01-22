class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement

  scope :completed, -> { where.not(completed_at: nil) }
  scope :not_disbursed, -> { includes(:disbursement).where(disbursements: { order_id: nil }) }
end
