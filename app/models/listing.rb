# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :user

  has_many :listing_categories
  has_many :listing_categories, through: :listing_categories
end
