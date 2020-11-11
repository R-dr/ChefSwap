# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :user

  belongs_to :category

  has_one :booking
end
