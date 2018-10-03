class CreateProvinceAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :province_assets do |t|
      t.string :province_asset_name, null: false
      t.references :area_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :province_asset_active, default: true
      t.text :province_asset_remarks

      t.timestamps
    end
    add_index :province_assets, :province_asset_name, unique: true
  end
end