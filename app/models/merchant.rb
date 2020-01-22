class Merchant < ApplicationRecord
  validates :CIF, uniqueness: true
end
