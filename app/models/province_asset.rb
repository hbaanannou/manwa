class ProvinceAsset < ApplicationRecord

  belongs_to :area_asset, required: true
  belongs_to :user, class_name: "Admin::User", required: true

	has_many :site_assets, -> { order(:site_asset_name) }
	has_many :production_site_assets, -> { order(:site_asset_name).by_production }, class_name: "SiteAsset"
	has_many :data_assets

	validates :user_id, uniqueness: true


	scope :by_loged_user, ->(loged_user) { where("user_id = ?", loged_user) }

end
