class ProAsphaltSub < ApplicationRecord
  belongs_to :pro_asphalt, required: true
  belongs_to :pro_asphalt_type, required: true
  belongs_to :pro_asphalt_product, required: true
  belongs_to :pro_reason, required: false

  validates :pro_asphalt_amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99999 }
  validates :pro_asphalt_amount, :pro_asphalt_type_id, :pro_asphalt_product_id,  presence: true

  validates :pro_reason, presence: true, if: Proc.new { |r| r.pro_asphalt_amount == 0 }

end
