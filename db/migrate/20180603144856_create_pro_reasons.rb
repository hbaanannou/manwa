class CreateProReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_reasons do |t|
      t.string :pro_reason_name, null: false

      t.timestamps
    end
    add_index :pro_reasons, :pro_reason_name, unique: true
  end
end
