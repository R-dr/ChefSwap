class Chef < ApplicationRecord
  belongs_to :user

  has_many :recipes, dependent: :destroy
  has_many :bookings, through: :listings, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reviews,through: :bookings


  validates :bio, presence: true, length: { in: 6..150 }
  validates :user_id, uniqueness: true

end