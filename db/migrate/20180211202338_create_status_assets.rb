class CreateStatusAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :status_assets do |t|
      t.string :status_asset_name, null: false
      t.boolean :status_asset_active, default: true
      t.text :status_asset_remarks

      t.timestamps
    end
    add_index :status_assets, :status_asset_name, unique: true
  end
end
