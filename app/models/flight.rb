class Flight < ApplicationRecord
    belongs_to :terminal
    has_many :bookings
    has_many :users, through: :bookings

    def self.airlines
      Flight.all.map {|flight| flight.airline }.uniq
    end

    def self.airline_count
      airlines.count
    end

    def self.number_of_flights(airline)
      Flight.all.select {|flight| flight.airline == airline }.count
    end

    def self.airline_with_most_flights # only finds first airline, not all
      Flight.airlines.max_by {|airline| Flight.number_of_flights(airline)}
    end

    def self.airline_with_least_flights # only finds first airline, not all
      Flight.airlines.min_by {|airline| Flight.number_of_flights(airline)}
    end

end
