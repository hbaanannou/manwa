class CreateSiteAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :site_assets do |t|
      t.string :site_asset_name, null: false
      t.references :province_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :site_asset_active, default: true
      t.text :site_asset_remarks
      t.integer :site_type, default: 0

      t.timestamps
    end
    add_index :site_assets, :site_asset_name, unique: true
  end
end