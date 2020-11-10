# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :user
  JOB_TYPES = %w[French Italian Asian Traveled Greek].freeze
end
