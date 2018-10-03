class CreateModelAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :model_assets do |t|
      t.string :model_asset_name, null: false
      t.boolean :model_asset_active, default: true
      t.text :model_asset_remarks

      t.timestamps
    end
    add_index :model_assets, :model_asset_name, unique: true
  end
end
