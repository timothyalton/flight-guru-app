class Flight < ApplicationRecord
    belongs_to :terminal
    has_many :bookings
    has_many :users, through: :bookings

end
