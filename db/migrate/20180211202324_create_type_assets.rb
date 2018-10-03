class CreateTypeAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :type_assets do |t|
      t.string :type_asset_name, null: false
      t.boolean :type_asset_active, default: true
      t.text :type_asset_remarks

      t.timestamps
    end
    add_index :type_assets, :type_asset_name, unique: true
  end
end
