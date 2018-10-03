class CreateColorAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :color_assets do |t|
      t.string :color_asset_name, null: false
      t.boolean :color_asset_active, default: true
      t.text :color_asset_remarks


      t.timestamps
    end
    add_index :color_assets, :color_asset_name, unique: true
  end
end
