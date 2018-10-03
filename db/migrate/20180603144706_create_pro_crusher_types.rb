class CreateProCrusherTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_crusher_types do |t|
      t.string :pro_crusher_type_name, null: false

      t.timestamps
    end
    add_index :pro_crusher_types, :pro_crusher_type_name, unique: true
  end
end
