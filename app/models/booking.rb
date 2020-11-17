class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :review, dependent: :destroy
  has_one :chef, through: :listing, dependent: :destroy
end
