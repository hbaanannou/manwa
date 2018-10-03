class WrongDataAsset < ApplicationRecord
  belongs_to :data_asset, required: true
  belongs_to :checklist, required: true
  belongs_to :employee_now, required: false, class_name: "Employee"
  belongs_to :employee_should, required: false, class_name: "Employee"
  belongs_to :site_now, required: false, class_name: "SiteAsset"
  belongs_to :site_should, required: false, class_name: "SiteAsset"
end
