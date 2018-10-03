class CreateWithdrawAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :withdraw_assets do |t|
      t.references :data_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :withdraw_reason
      t.text :withdraw_procedure

      t.references :site_asset_from, null: false
      t.references :province_asset_from, null: false

      t.references :site_asset_to, null: false
      t.references :province_asset_to, null: false

      t.integer :withdraw_status, default: 0
      t.date :transfer_date
      t.references :data_asset_lowbed

      t.boolean :delivery_done, default: false
      t.references :delivery_site_user
      t.references :delivery_province_user
      t.date :delivery_site_action_date
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