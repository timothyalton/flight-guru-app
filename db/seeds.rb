# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Terminal.destroy_all
Flight.destroy_all
Booking.destroy_all
Restaurant.destroy_all

u1 = User.create(name: "Mitchell")
u2 = User.create(name: "Placido")
u3 = User.create(name: "Paul")
u4 = User.create(name: "Gian")

t1 = Terminal.create(number: "A")
t2 = Terminal.create(number: "B")
t3 = Terminal.create(number: "C")

f1 = Flight.create(number: "AA1111", terminal_id: t1.id)
f2 = Flight.create(number: "SW123", terminal_id: t2.id)

b1 = Booking.create(ticket_number: "1ABC123", user_id: u1.id, flight_id: f1.id)
b2 = Booking.create(ticket_number: "1BCD234", user_id: u2.id, flight_id: f1.id)
b3 = Booking.create(ticket_number: "1CDE345", user_id: u3.id, flight_id: f1.id)
b4 = Booking.create(ticket_number: "1DEF456", user_id: u4.id, flight_id: f1.id)
b5 = Booking.create(ticket_number: "2ABC", user_id: u1.id, flight_id: f2.id)
b6 = Booking.create(ticket_number: "2CDF", user_id: u3.id, flight_id: f2.id)

r1 = Restaurant.create(name: "Chick-Fil-A", terminal_id: t1.id)
r2 = Restaurant.create(name: "Chick-Fil-A", terminal_id: t2.id)
r3 = Restaurant.create(name: "McDonald's", terminal_id: t1.id)
r4 = Restaurant.create(name: "Boomtown Coffee", terminal_id: t2.id)
r5 = Restaurant.create(name: "Peet's Coffee", terminal_id: t1.id)
r6 = Restaurant.create(name: "Salata", terminal_id: t2.id)
r7 = Restaurant.create(name: "Chipotle", terminal_id: t1.id)