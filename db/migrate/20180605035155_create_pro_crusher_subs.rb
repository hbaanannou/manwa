class CreateProCrusherSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_crusher_subs do |t|
      t.references :pro_crusher, null: false, foreign_key: true
      t.references :pro_crusher_type, null: false, foreign_key: true
      t.integer :measurement, null: false
      t.integer :pro_crusher_amount, null: false
      t.integer :pro_crusher_amount_meters, null: false
      t.references :pro_reason, foreign_key: true
      t.text :pro_crusher_note

      t.timestamps
    end
  end
end
