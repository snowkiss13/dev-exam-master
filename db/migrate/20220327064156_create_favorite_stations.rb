class CreateFavoriteStations < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_stations do |t|
      t.text :name_railway
      t.text :station_name
      t.integer :how_minute
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
