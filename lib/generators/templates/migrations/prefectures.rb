class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :name,                                 null: false

      t.timestamps
    end
  end
end
