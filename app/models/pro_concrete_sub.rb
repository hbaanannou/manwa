class ProConcreteSub < ApplicationRecord
  belongs_to :pro_concrete, required: true
  belongs_to :pro_concrete_type, required: true
  belongs_to :pro_concrete_product, required: true
  belongs_to :pro_reason, required: false

  validates :pro_concrete_amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99999 }
  validates :pro_concrete_amount, :pro_concrete_type_id, :pro_concrete_product_id,  presence: true

  validates :pro_reason, presence: true, if: Proc.new { |r| r.pro_concrete_amount == 0 }

end
