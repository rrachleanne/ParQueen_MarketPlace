class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :vendor_id
      t.integer :customer_id
      t.text :state
      t.text :suburb
      t.text :category
      t.integer :price
      t.boolean :availability
      t.string :picture

      t.timestamps
    end
  end
end
