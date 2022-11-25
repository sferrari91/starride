class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spaceships, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :bookings, through: :spaceships
  validates :email, presence: true
  validates :password, presence: true
end
