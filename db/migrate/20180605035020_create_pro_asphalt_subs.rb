class CreateProAsphaltSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_asphalt_subs do |t|
      t.references :pro_asphalt, null: false, foreign_key: true
      t.references :pro_asphalt_type, null: false, foreign_key: true
      t.references :pro_asphalt_product, null: false, foreign_key: true
      t.integer :pro_asphalt_amount, null: false
      t.references :pro_reason, foreign_key: true
      t.text :pro_asphalt_note

      t.timestamps
    end
  end
end
