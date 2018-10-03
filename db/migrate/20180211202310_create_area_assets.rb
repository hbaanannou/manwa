class CreateAreaAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :area_assets do |t|
      t.string :area_asset_name, null: false
      t.boolean :area_asset_active, default: true
      t.text :area_asset_remarks

      t.timestamps
    end
    add_index :area_assets, :area_asset_name, unique: true
  end
end
