class RepairOrder < ApplicationRecord

  enum repair_status: { requested: 0, received: 1, repaired: 2, returned: 3, opened: 4, hold: 5 }

  belongs_to :data_asset, required: true
  belongs_to :user, required: true, class_name: "Admin::User"
  belongs_to :site_asset, required: true
  belongs_to :site_user, required: false, class_name: "Admin::User"
  belongs_to :province_user, required: false, class_name: "Admin::User"
  belongs_to :employee

  belongs_to :workshop_site, required: false, class_name: "SiteAsset"
  belongs_to :workshop_site_user, required: false, class_name: "Admin::User"

  has_many :repair_breakdowns, inverse_of: :repair_order, dependent: :destroy
  accepts_nested_attributes_for :repair_breakdowns, allow_destroy: true, reject_if: proc { |att| att['repair_breakdown_name'].blank? }
  # accepts_nested_attributes_for :repair_breakdowns, allow_destroy: true, reject_if: :all_blank

  validates :repair_breakdowns, presence: true

  validates_uniqueness_of :data_asset_id, conditions: -> { where.not(repair_status: 'returned') }

  # for update only records add :persisted?
  validates :delivery_done, presence: true, if: (:requested? && :persisted?)


  validate :transfer_date_cannot_be_in_the_past


  scope :by_workshop_site, ->(workshop_site_id) { where("workshop_site_id = ?", workshop_site_id) }

  scope :by_site_user_0, ->(loged_user) { where("repair_status = 0 AND site_user_id = ?", loged_user) }
  scope :by_province_user_0, ->(loged_user) { where("repair_status = 0 AND province_user_id = ?", loged_user) }
  scope :by_workshop_site_user_0, ->(loged_user) { where("repair_status = 0 AND workshop_site_user_id = ?", loged_user) }

  scope :by_site_user_1, ->(loged_user) { where("repair_status = 1 AND site_user_id = ?", loged_user) }
  scope :by_province_user_1, ->(loged_user) { where("repair_status = 1 AND province_user_id = ?", loged_user) }
  scope :by_workshop_site_user_1, ->(loged_user) { where("repair_status = 1 AND workshop_site_user_id = ?", loged_user) }

  scope :by_site_user_2, ->(loged_user) { where("repair_status = 2 AND site_user_id = ?", loged_user) }
  scope :by_province_user_2, ->(loged_user) { where("repair_status = 2 AND province_user_id = ?", loged_user) }
  scope :by_workshop_site_user_2, ->(loged_user) { where("repair_status = 2 AND workshop_site_user_id = ?", loged_user) }

  scope :by_site_user_3, ->(loged_user) { where("repair_status = 3 AND site_user_id = ?", loged_user) }
  scope :by_province_user_3, ->(loged_user) { where("repair_status = 3 AND province_user_id = ?", loged_user) }
  scope :by_workshop_site_user_3, ->(loged_user) { where("repair_status = 3 AND workshop_site_user_id = ?", loged_user) }

  scope :by_site_user_4, ->(loged_user) { where("repair_status = 4 AND site_user_id = ?", loged_user) }
  scope :by_province_user_4, ->(loged_user) { where("repair_status = 4 AND province_user_id = ?", loged_user) }
  scope :by_workshop_site_user_4, ->(loged_user) { where("repair_status = 4 AND workshop_site_user_id = ?", loged_user) }

  scope :by_site_user_5, ->(loged_user) { where("repair_status = 5 AND site_user_id = ?", loged_user) }
  scope :by_province_user_5, ->(loged_user) { where("repair_status = 5 AND province_user_id = ?", loged_user) }
  scope :by_workshop_site_user_5, ->(loged_user) { where("repair_status = 5 AND workshop_site_user_id = ?", loged_user) }


  scope :by_requested, -> { where("repair_status = 0") }
  scope :by_received, -> { where("repair_status = 1") }
  scope :by_repaired, -> { where("repair_status = 2") }
  scope :by_returned, -> { where("repair_status = 3") }

  scope :by_opened, -> { where("repair_status = 4") }
  scope :by_hold, -> { where("repair_status = 5") }


  after_update :update_data_asset_site_after_transfer_to_workshop

  private

    def update_data_asset_site_after_transfer_to_workshop

      # puts saved_change_to_province_asset_id[0]   # value of province_asset_id before change in updated site_asset record
      # puts saved_change_to_province_asset_id[1]   # value of province_asset_id after change in updated site_asset record
      # self.id                                     # id in updated site_asset record

      if self.saved_change_to_delivery_done? && saved_change_to_delivery_done[1] == true

        this_asset_id = DataAsset.find(self.data_asset_id)

        this_asset_id.site_asset_id = self.workshop_site_id
        this_asset_id.status_before_repaire = this_asset_id.status_asset_id
        this_asset_id.status_asset_id = 5

        this_asset_id.save

      end

      if self.saved_change_to_return_done? && saved_change_to_return_done[1] == true

        return_this_asset_id = DataAsset.find(self.data_asset_id)

        return_this_asset_id.site_asset_id = self.site_asset_id
        return_this_asset_id.status_asset_id = return_this_asset_id.status_before_repaire
        return_this_asset_id.status_before_repaire = nil
        
        return_this_asset_id.save

      end

    end

    def transfer_date_cannot_be_in_the_past
      if !transfer_date.blank? and transfer_date < Date.today
        errors.add(:transfer_date, "can't be in the past")
      end
    end

  
end