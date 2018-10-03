class CreateTankFueldays < ActiveRecord::Migration[5.2]
  def change
    create_table :tank_fueldays do |t|
      t.date :day, null: false
      t.references :data_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :site_asset, null: false, foreign_key: true

      t.timestamps

      t.index [:data_asset_id, :day], unique: true
    end
  end
end
