class Shopper < ApplicationRecord
  validates :NIF, uniqueness: true
end
