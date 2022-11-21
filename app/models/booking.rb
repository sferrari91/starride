class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :spaceship_id
  validates start_date:, presence: true
  validates end_date:, presence: true, comparison: { greater_than: :end_date }
end
