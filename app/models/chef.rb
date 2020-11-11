class Chef < ApplicationRecord
  belongs_to :user
  has_many :recipes
  has_many :bookings, through: :listings
end
