class CreateShoppers < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppers do |t|
      t.text :name
      t.text :email
      t.text :nif

      t.timestamps
    end
  end
end
