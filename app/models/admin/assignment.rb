class Admin::Assignment < ApplicationRecord
  belongs_to :user, class_name: "Admin::User", required: true
  belongs_to :role, class_name: "Admin::Role", required: true
  belongs_to :employee, required: true

  validates :user_id, uniqueness: true
end
