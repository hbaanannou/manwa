class ProCrusher < ApplicationRecord
	
  belongs_to :province_pro_asset, required: true

  has_many :pro_crusher_subs, inverse_of: :pro_crusher, dependent: :destroy
  accepts_nested_attributes_for :pro_crusher_subs, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :pro_crusher_subs, allow_destroy: true, reject_if: proc { |att| att['pro_crusher_amount'].blank? }
  # accepts_nested_attributes_for :pro_crusher_subs, allow_destroy: true, reject_if: :all_blank

	validates_associated :pro_crusher_subs

  validates :pro_crusher_subs, presence: true

  validates :pro_crusher_hours, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }

  validates :pro_crusher_machines_num, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  validates :day, presence: true

  validates :province_pro_asset, uniqueness: { scope: :day, message: "should happen once per day" }

  validate :day_cannot_be_in_the_future


	private

  def day_cannot_be_in_the_future
    if !day.blank? and day > Date.today
      errors.add(:day, "can't be in the future")
    end
  end

end
