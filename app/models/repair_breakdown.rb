class RepairBreakdown < ApplicationRecord

	enum breakdown_status: { notopened: 0, opened: 1, hold: 2, close: 3}

  belongs_to :repair_order, optional: true

  has_many :breakdown_spares, inverse_of: :repair_breakdown, dependent: :destroy
  accepts_nested_attributes_for :breakdown_spares, allow_destroy: true, reject_if: proc { |att| att['spare_part_number'].blank? }
  # accepts_nested_attributes_for :repair_breakdowns, allow_destroy: true, reject_if: :all_blank

  
end
