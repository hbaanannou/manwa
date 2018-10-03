class CreateProAsphalts < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_asphalts do |t|
      t.references :province_pro_asset, null: false, foreign_key: true
      t.date :day, null: false
      t.integer :pro_asphalt_hours, null: false, default: 0
      t.integer :pro_asphalt_machines_num, default: 0
      
      t.timestamps

      t.index [:province_pro_asset_id, :day], unique: true
      
    end
  end
end
