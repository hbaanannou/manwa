class ProvinceProAsset < ApplicationRecord
  belongs_to :area_pro_asset, required: true
  belongs_to :user, class_name: "Admin::User", required: true

  has_many :pro_concretes
  has_many :pro_asphalts
  has_many :pro_crushers

end