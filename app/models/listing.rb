# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :chef
  belongs_to :category

  has_one :booking, dependent: :destroy
  has_one :user, through: :bookings
  # validates :date_available, future: true
  validates :title, :description, :price, :category, presence: true
  validates :price, numericality: { only_integer: true, greater_than: -1, less_than: 4000 }
  validates :description, length: { in: 15..150 }
  validates :title, length: { in: 5..45 }
end
