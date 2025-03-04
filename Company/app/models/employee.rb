class Employee < ApplicationRecord
  belongs_to :department
  attr_accessor :accept_terms
  after_create -> { Rails.logger.info("New employee created!") }
  # before_validation :ensure_age_has_value

  # before_validation do
  #   self.age = 23 if age.blank?     #macro-style class methods
  # end

  # before_validation ->(emp) { emp.age = 21 if emp.age.blank? }     #using proc

  # before_validation :ensure_age_has_value, on: :create
  
  before_validation :age_value
  after_validation :age_value_error

  after_create :message1
  after_update :message2

  def age_value
    puts "Age: #{age}"
  end

  def age_value_error
    puts "Age errors: #{errors[:age]}" 
  end


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
  # validates :age, comparison: { greater_than_or_equal_to: 18 }
  # validates :age, comparison: { less_than: 50 }
  # validates :age, comparison: { less_than_or_equal_to: 50 }
  # validates :age, comparison: { equal_to: 18 }
  # validates :age, comparison: { other_than: 21 }

# LENGTH 
  # validates :name, length: {minimum: 3}
  # validates :name, length: { maximum: 5 }
  validates :name, length: { in: 6..20 }
  # validates :name, length: { is: 6 }

# NUMERICALITY
  # validates :age, numericality: true
  validates :age, numericality: { only_integer: true, in: 18..50 , odd: true } ,  if: -> { age.present? }
  # validates :age, numericality: { greater_than: 18, less_than_or_equal_to: 50 }

# FORMAT
  validates_format_of :address, with: /\A[^0-9]+\z/  #no numbers allowed
  # validates_format_of :address, without: /\A[a-zA-Z]+\z/  #no letters allowed

# UNIQUENESS
  # validates :name, uniqueness: true

# INCLUSION
  # validates :gender, inclusion: { in: %w(male female) }
  # validates :gender, inclusion: { in: %w(male) , message: "%{value} is not a valid gender" }

# PRESENCE
  # validates :name, presence: true

# private

#   def ensure_age_has_value
#     if age.blank?
#       self.age = 23
#     end
#   end

def message1
  Rails.logger.info("Employee was created sucessfully")
end

def message2
  if saved_change_to_email?
    Rails.logger.info("Notification sent to admin about critical info update for: #{email}")
  end
end

end

