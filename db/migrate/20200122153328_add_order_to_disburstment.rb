class AddOrderToDisburstment < ActiveRecord::Migration[5.2]
  def change
    add_reference :disbursements, :order, foreign_key: true
  end
end
