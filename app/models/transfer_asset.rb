class TransferAsset < ApplicationRecord

	enum transfer_status: { opened: 0, accepted: 1, refused: 2, posted: 3, received: 4 }
  enum user_type: { sitemanager: 0, provincemanager: 1 }

  belongs_to :data_asset, required: true
  belongs_to :user, required: true, class_name: "Admin::User"
  belongs_to :site_asset_from, required: true, class_name: "SiteAsset"
  belongs_to :province_asset_from, required: false, class_name: "ProvinceAsset"
  belongs_to :site_asset_to, required: true, class_name: "SiteAsset"
  belongs_to :province_asset_to, required: false, class_name: "ProvinceAsset"
  belongs_to :transfer_dep_user, required: false, class_name: "Admin::User"
  belongs_to :data_asset_lowbed, required: false, class_name: "DataAsset"
  belongs_to :delivery_site_user, required: false, class_name: "Admin::User"
  belongs_to :delivery_province_user, required: false, class_name: "Admin::User"
  belongs_to :receive_site_user, required: false, class_name: "Admin::User"
  belongs_to :receive_province_user, required: false, class_name: "Admin::User"


  validates_uniqueness_of :data_asset_id, conditions: -> { where.not(transfer_status: ['refused', 'received']) }, message: "Has another opened transfer request."

  validates :data_asset_id, :transfer_reason, presence: true

  validates :refuse_reason, presence: true, if: :refused?

  validates :transfer_date, presence: true, if: :accepted?
  # validates :data_asset_lowbed_id, presence: true, if: :accepted?

  validates :delivery_done, presence: true, if: :posted?
  validates :receive_done, presence: true, if: :received?

  validate :transfer_date_cannot_be_in_the_past


  scope :by_delivery_site_user_0, ->(loged_user) { where("transfer_status = 0 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_0, ->(loged_user) { where("transfer_status = 0 AND delivery_province_user_id = ?", loged_user) }

  scope :by_delivery_site_user_1, ->(loged_user) { where("transfer_status = 1 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_1, ->(loged_user) { where("transfer_status = 1 AND delivery_province_user_id = ?", loged_user) }
  scope :by_receive_site_user_1, ->(loged_user) { where("transfer_status = 1 AND receive_site_user_id = ?", loged_user) }
  scope :by_receive_province_user_1, ->(loged_user) { where("transfer_status = 1 AND receive_province_user_id = ?", loged_user) }

  scope :by_delivery_site_user_2, ->(loged_user) { where("transfer_status = 2 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_2, ->(loged_user) { where("transfer_status = 2 AND delivery_province_user_id = ?", loged_user) }

  scope :by_delivery_site_user_3, ->(loged_user) { where("transfer_status = 3 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_3, ->(loged_user) { where("transfer_status = 3 AND delivery_province_user_id = ?", loged_user) }
  scope :by_receive_site_user_3, ->(loged_user) { where("transfer_status = 3 AND receive_site_user_id = ?", loged_user) }
  scope :by_receive_province_user_3, ->(loged_user) { where("transfer_status = 3 AND receive_province_user_id = ?", loged_user) }

  scope :by_delivery_site_user_4, ->(loged_user) { where("transfer_status = 4 AND delivery_site_user_id = ?", loged_user) }
  scope :by_delivery_province_user_4, ->(loged_user) { where("transfer_status = 4 AND delivery_province_user_id = ?", loged_user) }
  scope :by_receive_site_user_4, ->(loged_user) { where("transfer_status = 4 AND receive_site_user_id = ?", loged_user) }
  scope :by_receive_province_user_4, ->(loged_user) { where("transfer_status = 4 AND receive_province_user_id = ?", loged_user) }


  after_update :update_data_asset_site_after_transfer

  # after_create :update_others_to_not_active_after_create_new_request

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


    # def update_others_to_not_active_after_create_new_request

    #   other_transfer_requests = TransferAsset.where(data_asset_id: self.data_asset_id).where.not(id: self.id)

    #   other_transfer_requests.each do |other_transfer_request|
    #     other_transfer_request.transfer_asset_active = false
    #     other_transfer_request.save
    #   end

    # end


    def transfer_date_cannot_be_in_the_past
      if !transfer_date.blank? and transfer_date < Date.today
        errors.add(:transfer_date, "can't be in the past")
      end
    end
  

end
