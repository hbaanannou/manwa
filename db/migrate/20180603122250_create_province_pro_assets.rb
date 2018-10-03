class CreateProvinceProAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :province_pro_assets do |t|
      t.string :province_pro_asset_name, null: false
      t.references :area_pro_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :concrete, default: true
      t.boolean :asphalt, default: true
      t.boolean :crusher, default: true
      t.boolean :province_pro_asset_active, default: true
      t.text :province_pro_asset_remarks

      t.timestamps
    end
    add_index :province_pro_assets, :province_pro_asset_name, unique: true
  end
end