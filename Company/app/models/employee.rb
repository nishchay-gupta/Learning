class Employee < ApplicationRecord
  belongs_to :department
  attr_accessor :accept_terms
  validates :name, :gender, :address, :department_id, presence: true
  validates :accept_terms, acceptance: true , on: :create 
end
