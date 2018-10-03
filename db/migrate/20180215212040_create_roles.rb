class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :role_name, null: false
      t.boolean :role_active, default: true
      t.text :role_remarks

      t.timestamps
    end
    add_index :roles, :role_name, unique: true
  end
end