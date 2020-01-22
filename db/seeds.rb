# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

merchants = JSON.parse(File.read(Rails.root.join('storage', 'merchants.json')))
merchants["RECORDS"].each do |record|
  Merchant.create!(record)
end

shoppers = JSON.parse(File.read(Rails.root.join('storage', 'shoppers.json')))
shoppers["RECORDS"].each do |record|
  Shopper.create!(record)
end

orders = JSON.parse(File.read(Rails.root.join('storage', 'orders.json')))
orders["RECORDS"].each do |record|
  Order.create!(record)
end
