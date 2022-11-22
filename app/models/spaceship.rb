class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :planet, presence: true
  has_one_attached :photo
  validates :number_of_passenger, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
