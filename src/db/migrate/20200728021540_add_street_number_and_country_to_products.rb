class AddStreetNumberAndCountryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :street_no, :integer
    add_column :products, :country, :string
  end
end
