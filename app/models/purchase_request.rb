class PurchaseRequest < ApplicationRecord

  belongs_to :matrial_request, required: true

  has_many :breakdown_spares, inverse_of: :purchase_request
  accepts_nested_attributes_for :breakdown_spares

  validates :request_purchase_done, presence: true, if: :persisted?

  validates :purchase_done, presence: true, if: :request_purchase_done_was

  scope :by_riyadh, -> { joins(:matrial_request).where("matrial_requests.area_asset_id = 1") }
  scope :by_tabuk, -> { joins(:matrial_request).where("matrial_requests.area_asset_id = 2") }
  
end
