class Admin::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  # hany when you add , :registerable this will add signup link automatic plus activate its routes

	has_many :assignments, class_name: "Admin::Assignment"
	has_many :roles, class_name: "Admin::Role", through: :assignments

  has_many :province_assets
  has_many :site_assets

  validates :email, presence: true, uniqueness: true


  def role?(role)  
		roles.any? { |r| r.role_name.underscore.to_sym == role }  
	end

end
