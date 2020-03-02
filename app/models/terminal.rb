class Terminal < ApplicationRecord
    has_many :flights
    has_many :restaurants
    has_many :bookings, through: :flights
    has_many :users, through: :bookings

end
