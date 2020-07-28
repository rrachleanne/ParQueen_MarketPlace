class AddCountrytoProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :country, :text
  end
end
