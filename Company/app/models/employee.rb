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
  # validates :name, confirmation: { case_sensitive: false } , presence: true
  validates :name_confirmation, presence: { message: "must be filled in to confirm your name" }, if: -> { name.present? }

# COMPARISON VALIDATIONS
  # validates :age, comparison: { greater_than: 18 }
  validates :age, comparison: { greater_than_or_equal_to: 18 }
  # validates :age, comparison: { less_than: 50 }
  # validates :age, comparison: { less_than_or_equal_to: 50 }
  # validates :age, comparison: { equal_to: 18 }
  # validates :age, comparison: { other_than: 21 }

# LENGTH 
  # validates :name, length: {minimum: 3}
  # validates :name, length: { maximum: 5 }
  validates :name, length: { in: 6..20 }
  # validates :name, length: { is: 6 }
end

