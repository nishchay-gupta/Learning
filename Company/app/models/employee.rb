class Employee < ApplicationRecord
  belongs_to :department
  attr_accessor :accept_terms
  
  # validates :name, :gender, :address, :department_id, presence: true

# ACCEPTANCE VALIDATIONS
  # validates :accept_terms, presence: true
  validates :accept_terms, acceptance: { message: "must be abided" }
  # validates :accept_terms, acceptance: { accept: "1", message: 'must be checked' }

# CONFIRMATION VALIDATIONS
  validates :name, confirmation: true,  presence: true
  validates :name, confirmation: { case_sensitive: false } , presence: true
  validates :name_confirmation, presence: { message: "must be filled in to confirm your name" }, if: -> { name.present? }

end
