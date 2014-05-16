class CreateRailwayStations < ActiveRecord::Migration
  def change
    create_table :railway_stations do |t|
      t.integer :group_station_id,                      null: false
      t.string :name,                                   null: false
      t.string :kana_name
      t.string :english_name
      t.references :railway_line,                       null: false, index: true
      t.references :prefecture,                         null: false, index: true
      t.string :zip_code
      t.string :address
      t.decimal :longitude,     precision: 9, scale: 6
      t.decimal :latitude,      precision: 9, scale: 6
      t.date :opened_at
      t.date :closed_at
      t.integer :sort

      # t.datetime :deleted_at
      t.timestamps
    end
  end
end
