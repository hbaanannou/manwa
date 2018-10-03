class CreateProConcreteSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_concrete_subs do |t|
      t.references :pro_concrete, null: false, foreign_key: true
      t.references :pro_concrete_type, null: false, foreign_key: true
      t.references :pro_concrete_product, null: false, foreign_key: true
      t.integer :pro_concrete_amount, null: false
      t.references :pro_reason, foreign_key: true
      t.text :pro_concrete_note

      t.timestamps
    end
  end
end
