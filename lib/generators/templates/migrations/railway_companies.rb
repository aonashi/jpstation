class CreateRailwayCompanies < ActiveRecord::Migration
  def change
    create_table :railway_companies do |t|
      t.integer :railway_id,               null: false
      t.string :name,                      null: false
      t.string :kana_name
      t.string :official_name
      t.string :abbreviated_name
      t.string :url
      t.integer :company_type
      t.integer :sort

      # t.datetime :deleted_at
      t.timestamps
    end
  end
end
