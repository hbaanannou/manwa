class WithdrawAsset < ApplicationRecord

	enum withdraw_status: { opened: 0, posted: 1, received: 2 }

  belongs_to :data_asset, required: true
  belongs_to :user, required: true, class_name: "Admin::User"

  belongs_to :site_asset_from, required: true, class_name: "SiteAsset"
  belongs_to :province_asset_from, required: false, class_name: "ProvinceAsset"
  belongs_to :data_asset_lowbed, required: false, class_name: "DataAsset"
  belongs_to :delivery_site_user, required: false, class_name: "Admin::User"
  belongs_to :delivery_province_user, required: false, class_name: "Admin::User"

  belongs_to :site_asset_to, required: true, class_name: "SiteAsset"
  belongs_to :province_asset_to, required: false, class_name: "ProvinceAsset"
  belongs_to :receive_site_user, required: false, class_name: "Admin::User"
  belongs_to :receive_province_user, required: false, class_name: "Admin::User"


  validates_uniqueness_of :data_asset_id, conditions: -> { where.not(withdraw_status: 'received') }, message: "Has another opened withdraw request."

  validates :withdraw_reason, presence: true

  validates :transfer_date, presence: true
  # validates :data_asset_lowbed_id, presence: true

	# for update only records add :persisted?
  validates :delivery_done, presence: true, if: :posted?
  validates :receive_done, presence: true, if: :received?

  validate :withdraw_date_cannot_be_in_the_past


  scope :by_delivery_site_user_0, ->(loged_user) { where("withdraw_status = 0 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_0, ->(loged_user) { where("withdraw_status = 0 AND delivery_province_user_id = ?", loged_user) }

  scope :by_delivery_site_user_1, ->(loged_user) { where("withdraw_status = 1 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_1, ->(loged_user) { where("withdraw_status = 1 AND delivery_province_user_id = ?", loged_user) }
  scope :by_receive_site_user_1, ->(loged_user) { where("withdraw_status = 1 AND receive_site_user_id = ?", loged_user) }
  scope :by_receive_province_user_1, ->(loged_user) { where("withdraw_status = 1 AND receive_province_user_id = ?", loged_user) }

  scope :by_delivery_site_user_2, ->(loged_user) { where("withdraw_status = 2 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_2, ->(loged_user) { where("withdraw_status = 2 AND delivery_province_user_id = ?", loged_user) }
  scope :by_receive_site_user_2, ->(loged_user) { where("withdraw_status = 2 AND receive_site_user_id = ?", loged_user) }
  scope :by_receive_province_user_2, ->(loged_user) { where("withdraw_status = 2 AND receive_province_user_id = ?", loged_user) }

  after_update :update_data_asset_site_after_transfer

  private

    def update_data_asset_site_after_transfer

      # puts saved_change_to_province_asset_id[0]   # value of province_asset_id before change in updated site_asset record
      # puts saved_change_to_province_asset_id[1]   # value of province_asset_id after change in updated site_asset record
      # self.id                                     # id in updated site_asset record

      if self.saved_change_to_receive_done? && saved_change_to_receive_done[1] == true

        this_asset_id = DataAsset.find(self.data_asset_id)

        this_asset_id.site_asset_id = self.site_asset_to_id
        this_asset_id.province_asset_id = self.province_asset_to_id
        this_asset_id.data_asset_in_use = true

        this_asset_id.save

      end

    end


    def withdraw_date_cannot_be_in_the_past
      if !transfer_date.blank? and transfer_date < Date.today
        errors.add(:transfer_date, "can't be in the past")
      end
    end


end