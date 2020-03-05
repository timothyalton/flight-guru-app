class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :flight
    
    validates :flight_id, uniqueness: { scope: :user_id, message: "already added" }
end
