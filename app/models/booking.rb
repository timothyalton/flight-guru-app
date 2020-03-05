class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :flight
    
    validates :flight_id, uniqueness: { scope: :user_id, message: "already added" }

def departure_time
    # byebug
    if self.flight.departure_time
        DateTime.iso8601(self.flight.departure_time).strftime("%m-%d-%Y / %I:%M%p")
    else
        "Departure time not listed"
    end
end

def arrival_time
    if self.flight.arrival_time
        DateTime.iso8601(self.flight.arrival_time).strftime("%m-%d-%Y / %I:%M%p")
    else
        "Arrival time not listed"
    end
end

end
