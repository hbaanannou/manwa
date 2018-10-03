class CreateRequestAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :request_assets do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :user_type, default: 0
      t.references :type_asset, null: false, foreign_key: true
      # t.references :model_asset, foreign_key: true
      t.references :province_asset_to, null: false
      t.references :site_asset_to, null: false
      t.boolean :driver_request, default: false
      t.text :request_reason, null: false
      t.text :work_type, null: false

      t.date :need_date, null: false
      t.integer :need_days, null: false

      t.integer :request_status, default: 0
      t.references :site_user
      t.references :province_user
      t.datetime :province_user_action_date
      t.references :transfer_dep_user
      t.datetime :transfer_dep_action_date
      t.text :refuse_reason
      
      t.integer :accept_status
      t.integer :available_after_days
      t.date :available_date

      t.boolean :ready_done, default: false
      t.datetime :ready_dep_action_date
      t.date :ready_date
      t.references :data_asset_if_ours
      t.references :data_asset_lowbed

      t.boolean :receive_done, default: false
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