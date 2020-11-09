class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :listing, dependent: :destroy
  has_one_attached :avatar
  validates :email, length: { maximum: 40 }
  validates :email, uniqueness: true
end
