class User < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings
  has_many :terminals, through: :flights # check if this works? 
  has_many :restaurants, through: :terminals
  has_secure_password

  validates :username, uniqueness: true
  validates :name, :username, presence: true
  validates :username, :password, format: { without: /\s/, message: "cannot have spaces" }
  # validates :username, :password, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  def self.total_bookings
    Booking.all.count
  end

  def self.average_bookings_per_user
    (total_bookings.to_f/User.all.count).round(2)
  end
end
