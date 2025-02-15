class Product < ApplicationRecord
  attr_accessor :accept_terms  # Virtual attribute (not saved in DB)

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :category, presence: true
end
