class CreateBreakdownSpares < ActiveRecord::Migration[5.2]
  def change
    create_table :breakdown_spares do |t|
      t.references :repair_breakdown, null: false, foreign_key: true
      t.references :matrial_request, foreign_key: true
      t.references :purchase_request, foreign_key: true
      t.string :spare_part_number
      t.text :spare_description
      t.integer :spare_quantity, default: 1
      t.integer :available_spare_quantity
      t.integer :approved_spare_quantity
      t.integer :willpurchase_spare_quantity
      t.integer :purchased_spare_quantity
      t.integer :replacement_code
      t.integer :spare_status, default: 0

      t.text :refuse_reason

      t.timestamps
    end
  end
end
