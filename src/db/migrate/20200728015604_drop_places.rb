class DropPlaces < ActiveRecord::Migration[6.0]
  
  def change
    drop_table :places do |t|
      t.string :title, null: false
      t.text :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :vistied_by, null: false
      t.timestamps null: false
    end
  end
end
