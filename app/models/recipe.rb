class Recipe < ApplicationRecord
  belongs_to :chef
  has_many :comments, dependent: :destroy
end
