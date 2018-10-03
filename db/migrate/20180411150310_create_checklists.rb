class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.references :data_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :supervisor
      t.references :employee, foreign_key: true
      t.references :site_asset, foreign_key: true
      t.date :day, null: false
      t.boolean :engine_oil, default: false
      t.boolean :hydraulic_oil, default: false
      t.boolean :gear_oil, default: false
      t.boolean :breake_oil, default: false
      t.boolean :battery_water, default: false
      t.boolean :air_filter, default: false
      t.boolean :fuel_water_separator, default: false
      t.boolean :fuel_tank, default: false
      t.boolean :radiator_coolant_hoses, default: false
      t.boolean :lights_gauges, default: false
      t.boolean :joints_pto_shaft, default: false
      t.boolean :chain_tension, default: false
      t.boolean :tire_pressure, default: false
      t.boolean :tire_bolt, default: false
      t.boolean :fan_belt_tension, default: false
      t.boolean :air_tank, default: false
      t.integer :hours, default: 0
      t.integer :meters, default: 0
      t.text :notes
      t.boolean :wrong_site
      t.boolean :wrong_employee

      t.timestamps

      t.index [:data_asset_id, :day], unique: true
    end
  end
end