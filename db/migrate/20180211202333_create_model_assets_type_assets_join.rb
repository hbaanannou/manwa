class CreateModelAssetsTypeAssetsJoin < ActiveRecord::Migration[5.2]
  def change
    create_join_table :model_assets, :type_assets do |t|
		  t.index [:model_asset_id, :type_asset_id], unique: true, name: 'index_model_assets_type_assets'
		end
  end
end
