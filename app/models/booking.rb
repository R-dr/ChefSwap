class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :review
  has_one :chef, through: :listing
end
