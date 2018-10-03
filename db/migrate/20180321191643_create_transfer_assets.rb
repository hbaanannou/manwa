class CreateTransferAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :transfer_assets do |t|
      t.references :data_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :user_type, default: 0
      t.text :transfer_reason
      t.text :refuse_reason
      t.boolean :transfer_asset_active, default: true

      t.references :site_asset_from, null: false
      t.references :province_asset_from, null: false
      t.references :site_asset_to, null: false
      t.references :province_asset_to, null: false

      t.integer :transfer_status, default: 0
      t.references :transfer_dep_user
      t.datetime :transfer_dep_action_date
      t.date :transfer_date
      t.references :data_asset_lowbed

      t.boolean :delivery_done, default: false
      t.references :delivery_site_user
      t.references :delivery_province_user
      t.datetime :delivery_site_action_date
      t.boolean :delivery_transfer_driver_form, default: false
      t.boolean :delivery_repair_order, default: false
      t.boolean :delivery_accident_report, default: false
      t.boolean :delivery_maintenance_card, default: false
      t.boolean :delivery_car_license, default: false
      t.boolean :delivery_operation_card, default: false

      t.boolean :receive_done, default: false
      t.references :receive_site_user
      t.references :receive_province_user
      t.datetime :receive_site_action_date
      t.boolean :receive_transfer_driver_form, default: false
      t.boolean :receive_repair_order, default: false
      t.boolean :receive_accident_report, default: false
      t.boolean :receive_maintenance_card, default: false
      t.boolean :receive_car_license, default: false
      t.boolean :receive_operation_card, default: false

      t.timestamps
    end
  end
end
