class CreateAccidentAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :accident_assets do |t|
    	t.references :data_asset, null: false, foreign_key: true
      t.date :accident_asset_date, null: false
      t.text :accident_asset_remarks

      t.timestamps
    end
  end
end
