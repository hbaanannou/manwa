class CreateAssetFueldays < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_fueldays do |t|
      t.references :tank_fuelday, null: false, foreign_key: true
      t.references :data_asset, null: false, foreign_key: true
      t.integer :quantity, default: 0
      t.date :day, null: false

      t.timestamps

      t.index [:data_asset_id, :day], unique: true
    end
  end
end
