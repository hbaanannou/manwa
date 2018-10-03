class RequestAsset < ApplicationRecord

	enum request_status: { opened: 0, pass: 1, notpass: 2, accepted: 3, refused: 4, ready: 5, received: 6 }
  enum user_type: { sitemanager: 0, provincemanager: 1 }
	enum accept_status: { rent_by_you: 0, rent_by_us: 1, we_have: 2}


  belongs_to :user, required: true, class_name: "Admin::User"
  belongs_to :type_asset, required: true
  # belongs_to :model_asset
  belongs_to :province_asset_to, required: true, class_name: "ProvinceAsset"
  belongs_to :site_asset_to, required: true, class_name: "SiteAsset"

  belongs_to :site_user, required: false, class_name: "Admin::User"
  belongs_to :province_user, required: false, class_name: "Admin::User"
  belongs_to :transfer_dep_user, required: false, class_name: "Admin::User"

  belongs_to :data_asset_lowbed, required: false, class_name: "DataAsset"
  belongs_to :data_asset_if_ours, required: false, class_name: "DataAsset"
  

  validates :need_days, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 365 }

  validates :available_after_days, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 365 }, allow_blank: true

  validate :need_date_cannot_be_in_the_past

  validates :accept_status, presence: true, if: :accepted?
  validates :refuse_reason, presence: true, if: :refused?

  validates :available_after_days, presence: true, if: :rent_by_us?
  validates :available_after_days, presence: true, if: :we_have?

  validates :ready_done, presence: true, if: :ready?

  validates :ready_date, presence: true, if: :ready?
  validate :ready_date_cannot_be_in_the_past
  # validates :data_asset_lowbed_id, presence: true, if: :ready?

  validates :receive_done, presence: true, if: :received?


  scope :by_site_user_0, ->(loged_user) { where("request_status = 0 AND site_user_id = ?", loged_user) }
  scope :by_province_user_0, ->(loged_user) { where("request_status = 0 AND province_user_id = ?", loged_user) }

  scope :by_site_user_1, ->(loged_user) { where("request_status = 1 AND site_user_id = ?", loged_user) }
  scope :by_province_user_1, ->(loged_user) { where("request_status = 1 AND province_user_id = ?", loged_user) }

  scope :by_site_user_2, ->(loged_user) { where("request_status = 2 AND site_user_id = ?", loged_user) }
  scope :by_province_user_2, ->(loged_user) { where("request_status = 2 AND province_user_id = ?", loged_user) }

  scope :by_site_user_3, ->(loged_user) { where("request_status = 3 AND site_user_id = ?", loged_user) }
  scope :by_province_user_3, ->(loged_user) { where("request_status = 3 AND province_user_id = ?", loged_user) }

  scope :by_site_user_4, ->(loged_user) { where("request_status = 4 AND site_user_id = ?", loged_user) }
  scope :by_province_user_4, ->(loged_user) { where("request_status = 4 AND province_user_id = ?", loged_user) }

  scope :by_site_user_5, ->(loged_user) { where("request_status = 5 AND site_user_id = ?", loged_user) }
  scope :by_province_user_5, ->(loged_user) { where("request_status = 5 AND province_user_id = ?", loged_user) }

  scope :by_site_user_6, ->(loged_user) { where("request_status = 6 AND site_user_id = ?", loged_user) }
  scope :by_province_user_6, ->(loged_user) { where("request_status = 6 AND province_user_id = ?", loged_user) }


  scope :by_rent_by_us, -> { where("request_status = 3 AND accept_status = 1") }
  scope :by_we_have, -> { where("request_status = 3 AND accept_status = 2") }

  scope :by_rent_by_us_and_we_have, -> { where("request_status = 3 AND (accept_status = 1 OR accept_status = 2)") }


  after_update :update_data_asset_site_after_transfer


  private

    def update_data_asset_site_after_transfer

      # puts saved_change_to_province_asset_id[0]   # value of province_asset_id before change in updated site_asset record
      # puts saved_change_to_province_asset_id[1]   # value of province_asset_id after change in updated site_asset record
      # self.id                                     # id in updated site_asset record

      if self.data_asset_if_ours_id.present? && self.saved_change_to_receive_done? && saved_change_to_receive_done[1] == true

        this_asset_id = DataAsset.find(self.data_asset_if_ours_id)

        this_asset_id.site_asset_id = self.site_asset_to_id
        this_asset_id.province_asset_id = self.province_asset_to_id
        this_asset_id.data_asset_in_use = true

        this_asset_id.save

      end

    end


    def need_date_cannot_be_in_the_past
      if !need_date.blank? and need_date < Date.today
        errors.add(:need_date, "can't be in the past")
      end
    end


    def ready_date_cannot_be_in_the_past
      if !ready_date.blank? and ready_date < Date.today
        errors.add(:ready_date, "can't be in the past")
      end
    end


end