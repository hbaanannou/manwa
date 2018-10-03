class AssetFuelday < ApplicationRecord

  belongs_to :tank_fuelday, required: true
  belongs_to :data_asset, required: true

  validates :data_asset, uniqueness: { scope: :day, message: "should happen once per tank" }


  scope :by_riyadh, -> { joins(tank_fuelday: {site_asset: :province_asset}).where("province_assets.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(tank_fuelday: {site_asset: :province_asset}).where("province_assets.area_asset_id = 2") }

end
