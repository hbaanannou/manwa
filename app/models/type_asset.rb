class TypeAsset < ApplicationRecord

	has_and_belongs_to_many :model_assets, -> { order(:model_asset_name) }

  has_many :data_assets

	validates :type_asset_name, presence: true, uniqueness: true

end