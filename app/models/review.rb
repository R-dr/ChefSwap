class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  validates :content, presence: true, allow_blank: false
end
