class CreateRepairBreakdowns < ActiveRecord::Migration[5.2]
  def change
    create_table :repair_breakdowns do |t|
      t.references :repair_order, foreign_key: true
      t.string :repair_breakdown_name, null: false

      t.integer :breakdown_status, default: 0
      t.text :repair_breakdown_description
      t.date :repair_breakdown_test_date
      t.string :repair_breakdown_technician_name
      t.string :repair_breakdown_test_result

      # for after repair test by
      t.references :employee, foreign_key: true
      t.date :repair_breakdown_after_repair_test_date
      t.text :repair_breakdown_after_repair_remarks

      t.timestamps
    end
  end
end
