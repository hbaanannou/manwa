class CreateRepairOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :repair_orders do |t|
      t.references :data_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :site_asset, null: false, foreign_key: true
      t.references :employee, foreign_key: true
      t.date :transfer_date
      t.time :transfer_time

      t.references :site_user
      t.references :province_user

      t.integer :repair_status, default: 0
      
      t.references :workshop_site
      t.references :workshop_site_user

      t.boolean :delivery_done, default: false
      t.datetime :workshop_site_action_date
      t.boolean :workshop_ignition_switch, default: false
      t.boolean :workshop_equipment_card, default: false
      t.boolean :workshop_driver_card, default: false
      t.boolean :workshop_maintenance_card, default: false

      t.text :workshop_site_repair_note
      t.datetime :workshop_site_repair_date
      t.boolean :workshop_site_repair_done, default: false

      t.boolean :return_done, default: false
      t.datetime :return_site_action_date
      t.boolean :return_ignition_switch, default: false
      t.boolean :return_equipment_card, default: false
      t.boolean :return_driver_card, default: false
      t.boolean :return_maintenance_card, default: false


      t.timestamps
    end
  end
end
