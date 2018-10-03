class CreateProConcreteTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_concrete_types do |t|
      t.string :pro_concrete_type_name, null: false

      t.timestamps
    end
    add_index :pro_concrete_types, :pro_concrete_type_name, unique: true
  end
end
