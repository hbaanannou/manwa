class CreateMatrialRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :matrial_requests do |t|
      t.references :repair_order, null: false, foreign_key: true
      t.references :area_asset, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.boolean :store_done, default: false
      t.datetime :store_done_date

      t.boolean :manager_done, default: false
      t.datetime :manager_done_date

      t.timestamps
    end
  end
end