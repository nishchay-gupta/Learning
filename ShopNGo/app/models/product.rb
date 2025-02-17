class Product < ApplicationRecord
  attr_accessor :search, :range, :date, :time, :datetime, :password, :file, :website, :email, :accept_terms

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :category, presence: true
end
