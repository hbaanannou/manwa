class MatrialRequest < ApplicationRecord

  belongs_to :repair_order, required: true
  belongs_to :area_asset, required: true
  belongs_to :user, required: true, class_name: "Admin::User"

  has_many :breakdown_spares, inverse_of: :matrial_request
  accepts_nested_attributes_for :breakdown_spares

  has_many :purchase_requests

  validates_associated :breakdown_spares, if: :store_done_was, message: "Approved Quantity Number Required OR 0 for Refuse"

  validates :store_done, presence: true, if: :persisted?

  # _was to get original value of recore before update by the form
  validates :manager_done, presence: true, if: :store_done_was

  scope :by_riyadh, -> { where("area_asset_id = 1") }
  scope :by_tabuk, -> { where("area_asset_id = 2") }


end
