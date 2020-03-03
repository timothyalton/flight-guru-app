class User < ApplicationRecord
    has_many :bookings
    has_many :flights, through: :bookings
    has_many :terminals, through: :flights # check if this works? 
    has_many :restaurants, through: :terminals
end
