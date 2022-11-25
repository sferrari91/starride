class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :planet, presence: true
  validates :number_of_passenger, presence: true, numericality: { only_integer: true, greater_than: 0 }
  include PgSearch::Model
  pg_search_scope :search_by_name_and_planet,
    against: [ :name, :planet],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
