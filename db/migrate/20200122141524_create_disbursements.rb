class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.references :merchant, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
