class CreateProAsphaltTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_asphalt_types do |t|
      t.string :pro_asphalt_type_name, null: false

      t.timestamps
    end
    add_index :pro_asphalt_types, :pro_asphalt_type_name, unique: true
  end
end
