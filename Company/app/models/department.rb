class Department < ApplicationRecord
  has_many :employees
  # has_one :employee
end