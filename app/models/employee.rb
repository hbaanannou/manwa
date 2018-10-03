class Employee < ApplicationRecord


	scope :next, ->(id) { where("employees.id > ?", id).first }
  scope :prev, ->(id) { where("employees.id < ?", id).last }

	def number_name
    "#{employee_number} - #{employee_name}"
  end

end
