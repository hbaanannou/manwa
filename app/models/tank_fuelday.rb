class TankFuelday < ApplicationRecord

  belongs_to :data_asset, required: true
  belongs_to :user, required: true, class_name: "Admin::User"
  belongs_to :employee, required: true
  belongs_to :site_asset, required: true

  has_many :asset_fueldays, inverse_of: :tank_fuelday, dependent: :destroy
  accepts_nested_attributes_for :asset_fueldays, allow_destroy: true, reject_if: proc { |att| att['data_asset_id'].blank? }

	validates_associated :asset_fueldays

  validates :asset_fueldays, presence: true

  validates :day, presence: true

  validates :data_asset, uniqueness: { scope: :day, message: "should happen once per day" }


  validate :day_cannot_be_in_the_future

  validate :day_is_not_friday


  scope :by_riyadh, -> { joins(site_asset: :province_asset).where("province_assets.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(site_asset: :province_asset).where("province_assets.area_asset_id = 2") }


	private


    # example for check one from collection
    # here I check if this asset object not in use by pass it to a collection of not in use assets
    def self.in_riyadh?(this_tank_fuelday)  
      by_riyadh.any? { |r| r == this_tank_fuelday }  
    end

    # example for check one from collection
    # here I check if this asset object not in use by pass it to a collection of not in use assets
    def self.in_tabuk?(this_tank_fuelday)  
      by_tabuk.any? { |r| r == this_tank_fuelday }  
    end


	  def day_is_not_friday
		  if day.present? && day.friday?
		    errors.add(:day, "Day Date can't be Friday")
		  end
		end


    def day_cannot_be_in_the_future
      if !day.blank? and day > Date.today
        errors.add(:day, "can't be in the future")
      end
    end


end
