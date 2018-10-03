class ProCrusherSub < ApplicationRecord

  before_save :update_pro_crusher_amount_meters

	enum measurement: { meter: 0, rad: 1 }

  belongs_to :pro_crusher, required: true
  belongs_to :pro_crusher_type, required: true
  belongs_to :pro_reason, required: false

  validates :pro_crusher_amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99999 }
  validates :pro_crusher_amount, :pro_crusher_type_id,  presence: true

  validates :pro_reason, presence: true, if: Proc.new { |r| r.pro_crusher_amount == 0 }

  validates :measurement, presence: true


   private

    def update_pro_crusher_amount_meters
      if self.measurement == "rad"
        self.pro_crusher_amount_meters = self.pro_crusher_amount * 1
      else
      	self.pro_crusher_amount_meters = self.pro_crusher_amount
      end
    end

end
