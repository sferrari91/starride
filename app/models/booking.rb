class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship
  validates start_date:, presence: true
  validates end_date:, presence: true, comparison: { greater_than: :end_date }
end
