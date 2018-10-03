class Admin::Role < ApplicationRecord

	has_many :assignments, class_name: "Admin::Assignment"
	has_many :users, class_name: "Admin::User", through: :assignments


	validates :role_name, presence: true, uniqueness: true

end
