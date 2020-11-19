# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :recipes, through: :chefs
  has_one :chef, dependent: :destroy

  validates :email, length: { maximum: 40 }
  validates :email, uniqueness: true # a single email cant have multiple accounts
end
