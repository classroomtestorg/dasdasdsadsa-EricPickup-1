class Event < ApplicationRecord
  has_many :registrations
  has_many :users, through: :registrations
  has_many :guests, through: :registrations

  validates :title, :description, :location, :date, presence: true, length: { minimum: 3 }
  validates :capacity, presence: true

  def current_capacity
    self.users.size + self.guests.size
  end

  def spots_remaining
    self.capacity - self.current_capacity
  end

  def all_guests
    self.users + self.guests
  end
end
