class Chef < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  has_many :recipes, dependent: :destroy
  has_many :bookings
  has_many :listings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :avatar, presence: true
  validates :bio, presence: true, length: { in: 6..150 }
  validates :user_id, uniqueness: true
  validates :avatar, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
end
