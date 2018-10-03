class CreateAreaProAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :area_pro_assets do |t|
      t.string :area_pro_asset_name, null: false
      t.boolean :area_pro_asset_active, default: true
      t.text :area_pro_asset_remarks

      t.timestamps
    end
    add_index :area_pro_assets, :area_pro_asset_name, unique: true
  end
end
