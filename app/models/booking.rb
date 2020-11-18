class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  belongs_to :chef

  has_one :review, dependent: :destroy
end
