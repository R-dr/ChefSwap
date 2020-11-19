class Review < ApplicationRecord
  belongs_to :booking # FK
  belongs_to :user #FK
  validates :content, presence: true, allow_blank: false
end
