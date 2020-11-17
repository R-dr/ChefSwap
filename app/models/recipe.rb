class Recipe < ApplicationRecord
  belongs_to :chef

  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_one_attached :image

  validates :title, :body, :image, :cooktime, presence: true
  validates :body , length: { in: 15..150 }
  validates :title, length: { in: 5..45 }
  validates :title, length: { in: 0..300 }
end
