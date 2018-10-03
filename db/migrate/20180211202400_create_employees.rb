class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :employee_number, null: false
      t.string :employee_name, null: false
      t.string :employee_mobile
      t.boolean :employee_active, default: true
      t.text :employee_remarks

      t.timestamps
    end
    add_index :employees, :employee_number, unique: true
    add_index :employees, :employee_name, unique: true
  end
end
