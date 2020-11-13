# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :chef
  belongs_to :category

  has_one :booking
  

  validates :title, :description, :price, :category, presence: true
  validates :price, numericality: { only_decimal: true }
  validates :description, length: { in: 15..150 }
  validates :title, length: { in: 5..45 }
end