class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.text :property
      t.integer :rent
      t.text :address
      t.integer :building_age
      t.text :remark

      t.timestamps
    end
  end
end
