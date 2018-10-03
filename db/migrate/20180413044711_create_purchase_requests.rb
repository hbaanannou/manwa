class CreatePurchaseRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_requests do |t|
      t.references :matrial_request, null: false, foreign_key: true

      t.boolean :request_purchase_done, default: false
      t.datetime :request_purchase_done_date

      t.boolean :purchase_done, default: false
      t.datetime :purchase_done_date

      t.timestamps
    end
  end
end