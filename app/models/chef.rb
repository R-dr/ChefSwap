class Chef < ApplicationRecord
  belongs_to :user

  has_many :recipes, dependent: :destroy
  has_many :bookings, through: :listings
  
  validates :user_id, uniqueness: true
  has_many :listings, dependent: :destroy
end
