class AddNumbertoProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :street_no, :integer
  end
end
