class CreateProAsphaltProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :pro_asphalt_products do |t|
      t.string :pro_asphalt_product_name, null: false

      t.timestamps
    end
    add_index :pro_asphalt_products, :pro_asphalt_product_name, unique: true
  end
end
