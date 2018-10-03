class CreateDataAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :data_assets do |t|
      t.string :data_asset_serial, null: false
      t.references :type_asset, null: false, foreign_key: true
      t.references :model_asset, foreign_key: true
      t.date :data_asset_arrived_date
      t.string :data_asset_plate_no
      t.string :data_asset_chassis_no
      t.string :data_asset_arrangement_no
      t.string :data_asset_manufacture_year
      t.references :color_asset, foreign_key: true
      t.string :data_asset_warranty
      t.string :data_asset_madein
      t.string :data_asset_purchasefrom
      t.string :data_asset_invoice_no

      t.integer :status_before_repaire

      t.references :status_asset, foreign_key: true
      t.references :province_asset, null: false, foreign_key: true
      t.references :site_asset, null: false, foreign_key: true
      t.references :employee, foreign_key: true
      t.boolean :data_asset_in_use, default: true
      t.references :user, null: false, foreign_key: true
      t.boolean :data_asset_active, default: true
      t.text :data_asset_current_condition
      t.text :data_asset_remarks

      t.string :data_asset_acquisition_value
      t.date :data_asset_acquisition_date
      t.string :data_asset_book_value

      t.string :data_asset_engine_model_1
      t.string :data_asset_engine_serial_no_1
      t.string :data_asset_engine_family_1
      t.string :data_asset_engine_arrangement_1
      t.string :data_asset_engine_displacement_no_1
      t.string :data_asset_engine_rating_1
      t.string :data_asset_engine_code_1

      t.string :data_asset_engine_model_2
      t.string :data_asset_engine_serial_2
      t.string :data_asset_engine_family_2
      t.string :data_asset_engine_arrangement_2
      t.string :data_asset_engine_displacement_no_2
      t.string :data_asset_engine_rating_2
      t.string :data_asset_engine_code_2

      t.string :data_asset_transmission_model
      t.string :data_asset_transmission_serial_no
      t.string :data_asset_transmission_arrangement

      t.string :data_asset_concrete_mixer_name
      t.string :data_asset_concrete_mixer_model
      t.string :data_asset_concrete_mixer_serial_no
      t.string :data_asset_concrete_mixer_capacity


      t.string :data_asset_concrete_pump_name
      t.string :data_asset_concrete_pump_model
      t.string :data_asset_concrete_pump_serial_no

      t.string :data_asset_generator_no
      t.string :data_asset_generator_controller_no
      t.string :data_asset_generator_governor_no
      t.string :data_asset_generator_alternator_no
      t.string :data_asset_generator_alternator_model
      t.string :data_asset_generator_alternator_serial_no
      t.string :data_asset_generator_rated_voltage
      t.string :data_asset_generator_phase
      t.string :data_asset_generator_rated_frequency
      t.string :data_asset_generator_rated_current_prime
      t.string :data_asset_generator_rated_rpm
      t.string :data_asset_generator_altitude
      t.string :data_asset_generator_rated_power
      t.string :data_asset_generator_manufacture_year
      t.string :data_asset_generator_madein
      t.datetime :deleted_at


      t.timestamps
    end
    add_index :data_assets, :data_asset_serial, unique: true
    add_index :data_assets, :deleted_at
  end
end
    