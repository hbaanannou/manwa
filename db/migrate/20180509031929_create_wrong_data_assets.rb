class CreateWrongDataAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :wrong_data_assets do |t|
      t.references :data_asset, null: false, foreign_key: true
      t.references :checklist, null: false, foreign_key: true
      t.references :employee_now
      t.references :employee_should
      t.references :site_now
      t.references :site_should

      t.timestamps
    end
  end
end
