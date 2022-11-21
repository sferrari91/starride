class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :planet, presence: true
  validates :number_of_passengers, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
