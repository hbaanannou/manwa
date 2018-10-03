class ModelAsset < ApplicationRecord

  has_and_belongs_to_many :type_assets, required: true

  has_many :data_assets

	validates :model_asset_name, presence: true, uniqueness: true

end
