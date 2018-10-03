class BreakdownSpare < ApplicationRecord

  before_update :breakdown_spare_status_changes

	enum spare_status: { newspare: 0, requested: 1, instore: 2, notinstore: 3, willpurchase: 4, purchased: 5, received: 6, refused: 7, receivedbystore: 8 }

  belongs_to :repair_breakdown, required: true
  belongs_to :matrial_request, inverse_of: :breakdown_spares, required: false
  belongs_to :purchase_request, inverse_of: :breakdown_spares, required: false
  belongs_to :user, required: false, class_name: "Admin::User"

  # validates :refuse_reason, presence: true, if: :refused?

  scope :by_spare_status_1, -> { where("spare_status = 1") }
  scope :by_spare_status_2, -> { where("spare_status = 2") }
  scope :by_spare_status_3, -> { where("spare_status = 3") }
  scope :by_spare_status_4, -> { where("spare_status = 4") }
  scope :by_spare_status_5, -> { where("spare_status = 5") }
  scope :by_spare_status_6, -> { where("spare_status = 6") }
  scope :by_spare_status_7, -> { where("spare_status = 7") }
  scope :by_spare_status_8, -> { where("spare_status = 8") }
  scope :by_spare_status_2_or_8, -> { where("spare_status = 2 OR spare_status = 8") }

  scope :by_not_refused, -> { where("spare_status != 7") }
  scope :by_not_received, -> { where("spare_status != 6") }
  scope :by_not_receivedbystore, -> { where("spare_status != 8") }

  scope :by_riyadh, -> { joins(:matrial_request).where("matrial_requests.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(:matrial_request).where("matrial_requests.area_asset_id = 2") }


  validates :spare_status, presence: true

  validate :should_select_qu_if_in, if: :matrial_request_store_done?

  validate :available_spare_quantity_cannot_be_more_than_requested_spare_quantity

  validate :approved_spare_quantity_cannot_be_more_than_requested_spare_quantity

  validates :approved_spare_quantity, presence: true, if: :matrial_request_manager_done?




  private

    def breakdown_spare_status_changes
      unless self.approved_spare_quantity.nil?
        if self.approved_spare_quantity.to_i == 0
          self.spare_status = 'refused'
        elsif self.spare_status == 'notinstore' and self.approved_spare_quantity.to_i > 0
          self.spare_status = 'willpurchase'
          self.willpurchase_spare_quantity = self.approved_spare_quantity
        elsif self.spare_status == 'instore' and self.approved_spare_quantity.to_i > self.available_spare_quantity.to_i
          self.spare_status = 'willpurchase'
          self.willpurchase_spare_quantity = (self.approved_spare_quantity.to_i - self.available_spare_quantity.to_i)
        end
      end
    end

    def matrial_request_store_done?
      matrial_request && matrial_request.store_done
    end

    def matrial_request_manager_done?
      matrial_request && matrial_request.manager_done
    end

    def approved_spare_quantity_cannot_be_more_than_requested_spare_quantity
      if !approved_spare_quantity.blank? && approved_spare_quantity > spare_quantity
        errors.add(:approved_spare_quantity, "can't be more than requested")
      end
    end

    def available_spare_quantity_cannot_be_more_than_requested_spare_quantity
      if !available_spare_quantity.blank? && available_spare_quantity > spare_quantity
        errors.add(:available_spare_quantity, "can't be more than requested")
      end
    end

    def should_select_qu_if_in
      if spare_status == 'instore' && available_spare_quantity.blank?
        errors.add(:available_spare_quantity, "can't be empty")
      end
    end
  
end