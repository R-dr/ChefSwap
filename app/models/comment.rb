class Comment < ApplicationRecord
  belongs_to :recipe # FK
  belongs_to :user # FK

  validates :body, presence: true, allow_blank: false # needs to have some text input
end
