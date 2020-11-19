class Recipe < ApplicationRecord
  belongs_to :chef

  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_one_attached :image

  validates :title, :body, :image, :cooktime, presence: true
  validates :body, length: { in: 15..1000 }
  validates :title, length: { in: 5..45 }
  validates :cooktime, numericality: { only_integer: true, greater_than: -1, less_than: 400 }
  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
end
