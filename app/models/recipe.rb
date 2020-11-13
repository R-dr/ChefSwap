class Recipe < ApplicationRecord
  belongs_to :chef
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
