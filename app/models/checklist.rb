class Checklist < ApplicationRecord

  belongs_to :data_asset, required: true
  belongs_to :user, required: true, class_name: "Admin::User"
  belongs_to :employee, required: true
  belongs_to :supervisor, required: true, class_name: "Employee"

  scope :by_data_asset, ->(data_asset_id) { where("data_asset_id = ?", data_asset_id) }

  validates :meters, numericality: { greater_than_or_equal_to: Proc.new{ |checklist_item| Checklist.by_data_asset(checklist_item.data_asset_id).any? ? Checklist.by_data_asset(checklist_item.data_asset_id).maximum("meters").to_i : 0 }, :message => 'Reading must be greater than or equal to last one' }, if: :new_record?

# , allow_blank: true
  validates :meters, numericality: { less_than_or_equal_to: 9999999 }

	validates :hours, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }

	validate :day_cannot_be_in_the_future


  scope :by_riyadh, -> { joins(data_asset: :province_asset).where("province_assets.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(data_asset: :province_asset).where("province_assets.area_asset_id = 2") }



  after_create :create_wrong_data_asset_if_worng_site_or_employee


    def create_wrong_data_asset_if_worng_site_or_employee

      # puts saved_change_to_province_asset_id[0]   # value of province_asset_id before change in updated site_asset record
      # puts saved_change_to_province_asset_id[1]   # value of province_asset_id after change in updated site_asset record
      # self.id                                     # id in updated site_asset record

      if (self.saved_change_to_wrong_site? && saved_change_to_wrong_site[1] == true) || (self.saved_change_to_wrong_employee? && saved_change_to_wrong_employee[1] == true)

        asset_now = DataAsset.find(self.data_asset_id)

        WrongDataAsset.create(data_asset_id: self.data_asset_id, checklist_id: self.id, employee_now_id: asset_now.employee_id, employee_should_id: self.employee_id, site_now_id: asset_now.site_asset_id, site_should_id: self.site_asset_id)

      end

    end




	private

    def day_cannot_be_in_the_future
      if !day.blank? and day > Date.today
        errors.add(:day, "can't be in the future")
      end
    end

end