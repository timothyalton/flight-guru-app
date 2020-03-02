# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: "Mitchell")
u2 = User.create(name: "Placido")
u3 = User.create(name: "Paul")
u4 = User.create(name: "Gian")

f1 = Flight.create(number: "AA1111")
f2 = Flight.create(number: "SW123")

b1 = Booking.create(ticket_number: "1ABC123", user_id: u1.id, flight_id: f1.id)
b2 = Booking.create(ticket_number: "1BCD234", user_id: u2.id, flight_id: f1.id)
b3 = Booking.create(ticket_number: "1CDE345", user_id: u3.id, flight_id: f1.id)
b4 = Booking.create(ticket_number: "1DEF456", user_id: u4.id, flight_id: f1.id)
b5 = Booking.create(ticket_number: "2ABC", user_id: u1.id, flight_id: f2.id)
b6 = Booking.create(ticket_number: "2CDF", user_id: u3.id, flight_id: f2.id)