class Employee < ApplicationRecord
  belongs_to :department
  attr_accessor :accept_terms
  
  # validates :name, :gender, :address, :department_id, presence: true

# ACCEPTANCE VALIDATIONS
  validates :accept_terms, presence: true
  validates :accept_terms, acceptance: { message: "must be abided" }
  validates :accept_terms, acceptance: { accept: "1", message: 'must be checked' }

end
