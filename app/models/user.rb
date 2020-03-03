class User < ApplicationRecord
    has_many :bookings
    has_many :flights, through: :bookings
    has_many :teminals, through: :flights # check if this works? 
    has_many :restaurants, through: :terminals
    has_secure_password
end
