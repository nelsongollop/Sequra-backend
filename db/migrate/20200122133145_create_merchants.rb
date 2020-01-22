class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.text :name
      t.text :email
      t.text :cif

      t.timestamps
    end
  end
end
