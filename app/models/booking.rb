class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
end
