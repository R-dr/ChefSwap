# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :chef # FK
  belongs_to :category # FK

  has_one :booking, dependent: :destroy
  has_one :user, through: :bookings
  
  validates :location, length: { in: 1..20 }
  validates :date_available, future: true #future validation check, disable to test locally
  validates :title, :description, :price, :category, presence: true
  validates :price, numericality: { only_integer: true, greater_than: -1, less_than: 4000 }
  validates :description, length: { in: 15..150 }
  validates :title, length: { in: 5..45 }
end
