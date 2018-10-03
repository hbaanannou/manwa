class CreateProConcreteProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_concrete_products do |t|
      t.string :pro_concrete_product_name, null: false

      t.timestamps
    end
    add_index :pro_concrete_products, :pro_concrete_product_name, unique: true
  end
end
