class SiteAsset < ApplicationRecord

  enum site_type: { production: 0, workshop: 1}

  belongs_to :province_asset, required: true
  belongs_to :user, class_name: "Admin::User", required: true

  has_many :data_assets
  has_many :from_transfer_assets, foreign_key: 'site_asset_from_id'
  has_many :to_transfer_assets, foreign_key: 'site_asset_to_id'

  validates :user_id, uniqueness: true


  # scope :by_province_workshop, ->(loged_user) { joins(:province_asset).where("site_assets.user_id = ?", loged_user) }
  # scope :get_assets_user_province, ->(loged_user) { joins(:province_asset).where("province_assets.site_assets.user_id = ?", loged_user) }

  scope :by_production, -> { where(site_type: :production) }

  scope :by_workshop, -> { where(site_type: :workshop) }

  scope :by_riyadh, -> { joins(:province_asset).where("province_assets.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(:province_asset).where("province_assets.area_asset_id = 2") }

  scope :by_province, ->(loged_user_id) { joins(:province_asset).where("province_assets.user_id = ?", loged_user_id) }

  scope :by_workshop_province, ->(loged_user_province_id) { where("site_type = 1 AND province_asset_id = ?", loged_user_province_id) }
  scope :by_loged_user, ->(loged_user) { where("user_id = ?", loged_user) }



  after_update :update_province_asset_id_in_data_asset

  def update_province_asset_id_in_data_asset

  	# puts saved_change_to_province_asset_id[0]   # value of province_asset_id before change in updated site_asset record
  	# puts saved_change_to_province_asset_id[1]   # value of province_asset_id after change in updated site_asset record
  	# self.id                                     # id in updated site_asset record

  	if self.saved_change_to_province_asset_id?

  		site_province_in_data_assets = DataAsset.where("site_asset_id = #{self.id}")

	  	site_province_in_data_assets.each do |site_province_in_data_asset|

	  		site_province_in_data_asset[:province_asset_id] = saved_change_to_province_asset_id[1]
        
	  		site_province_in_data_asset.save

	  	end

	  end

  end

  
end