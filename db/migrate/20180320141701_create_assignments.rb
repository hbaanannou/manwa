class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps

      t.index [:user_id, :role_id], unique: true
    end
  end
end