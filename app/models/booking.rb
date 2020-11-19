class Booking < ApplicationRecord
  belongs_to :listing # FK
  belongs_to :user  # FK
  belongs_to :chef # FK

  has_one :review, dependent: :destroy
end
