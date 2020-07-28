class AddStreetToProduct < ActiveRecord::Migration[6.0]
   
  def change
    add_column :products, :street, :text
  end
end
