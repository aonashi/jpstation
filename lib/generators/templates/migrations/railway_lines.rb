class CreateRailwayLines < ActiveRecord::Migration
  def change
    create_table :railway_lines do |t|
      t.references :railway_company,                   null: false, index: true
      t.string :name,                                  null: false
      t.string :kana_name
      t.string :official_name
      t.string :color_code
      t.string :color_name
      t.integer :line_type
      t.decimal :longitude,    precision: 17, scale: 14
      t.decimal :latitude,     precision: 17, scale: 14
      t.integer :zoom
      t.integer :sort

      # t.datetime :deleted_at
      t.timestamps
    end
  end
end
