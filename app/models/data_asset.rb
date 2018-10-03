class DataAsset < ApplicationRecord
  acts_as_paranoid
  nilify_blanks
  
  belongs_to :type_asset, required: true
  belongs_to :model_asset
  belongs_to :color_asset
  belongs_to :status_asset
  belongs_to :province_asset, required: true
  belongs_to :site_asset, required: true
  belongs_to :employee
  belongs_to :user, class_name: "Admin::User", required: true

  has_many :accident_assets
  has_many :transfer_assets
  has_many :asset_fueldays, inverse_of: :data_asset
  has_many :checklists, inverse_of: :data_asset


  has_many_attached :images
	accepts_nested_attributes_for :images_attachments, allow_destroy: true

  before_update :purge_blobs

  def purge_blobs
    images_attachments.each do |image_attachment|
      if image_attachment.marked_for_destruction?
        image_attachment.purge_later
      end
    end
  end


  validates :data_asset_serial, presence: true
  validates :data_asset_serial, uniqueness: true

  scope :by_site_manager, ->(loged_user) { joins(:site_asset).where("site_assets.user_id = ?", loged_user) }
  scope :not_by_site_manager, ->(loged_user) { joins(:site_asset).where.not("site_assets.user_id = ?", loged_user) }

  scope :by_province_manager, ->(loged_user) { joins(:province_asset).where("province_assets.user_id = ?", loged_user) }
  scope :not_by_province_manager, ->(loged_user) { joins(:province_asset).where.not("province_assets.user_id = ?", loged_user) }

  scope :next, ->(id) { where("data_assets.id > ?", id).first }
  scope :prev, ->(id) { where("data_assets.id < ?", id).last }

  scope :by_not_in_use, -> { where(data_asset_in_use: false) }

  # scope :by_not_in_use_and_not_open, -> { left_joins(:transfer_assets).where("data_assets.data_asset_in_use = false AND ( transfer_assets.data_asset_id IS NULL OR ( transfer_assets.transfer_status NOT IN (0, 1, 3) AND transfer_assets.transfer_asset_active = true ) )") }

  scope :by_riyadh, -> { joins(:province_asset).where("province_assets.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(:province_asset).where("province_assets.area_asset_id = 2") }


  # example for check one from collection
  # here I check if this asset object not in use by pass it to a collection of not in use assets
  def self.asset_not_in_use?(this_data_asset)  
    by_not_in_use.any? { |r| r == this_data_asset }  
  end


end
