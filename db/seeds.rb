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

u1 = User.create(name: "Mitchell", username: "gitmoneygitpaid", password: "123")
u2 = User.create(name: "Placido", username: "p-money", password: "123")
u3 = User.create(name: "Paul", username: "deathcab", password: "123")
u4 = User.create(name: "Gian", username: "chickfilaplz", password: "123")
u5 = User.create(name: "TheOne", username: "1", password: "1")

# t1 = Terminal.create(number: "A", airport: )
# t2 = Terminal.create(number: "B")
# t3 = Terminal.create(number: "C")

# f1 = Flight.create(number: "AA1111", terminal_id: t1.id)
# f2 = Flight.create(number: "SW123", terminal_id: t2.id)
@flight_data_arr_iah = HTTParty.get('http://api.aviationstack.com/v1/flights?access_key=16e6c3c05aa63a516a8b6ea32be8a235&arr_iata=IAH')

@flight_data_arr_iah["data"].each do |d|
    t = Terminal.find_or_create_by(number: d['arrival']['terminal'], airport: d['arrival']['airport'], iata: d['arrival']['iata'])
    Flight.create(number: d['flight']['iata'], 
    airline: d['airline']['name'], 
    departing_ap: d['departure']['airport'], 
    date: d['flight_date'], 
    arrival_time: d['arrival']['scheduled'], 
    terminal_id: t.id,)
end

# b1 = Booking.create(user_id: u1.id, flight_id: Flight.all.sample.id)
# b2 = Booking.create(user_id: u2.id, flight_id: Flight.all.sample.id)
# b3 = Booking.create(user_id: u3.id, flight_id: Flight.all.sample.id)
# b4 = Booking.create(user_id: u4.id, flight_id: Flight.all.sample.id)
# b5 = Booking.create(user_id: u1.id, flight_id: Flight.all.sample.id)
# b6 = Booking.create(user_id: u3.id, flight_id: Flight.all.sample.id)

# r1 = Restaurant.create(name: "Chick-Fil-A", terminal_id: Terminal.first.id)
# r2 = Restaurant.create(name: "Chick-Fil-A", terminal_id: Terminal.last.id)
# r3 = Restaurant.create(name: "McDonald's", terminal_id: Terminal.second.id)
# r4 = Restaurant.create(name: "Boomtown Coffee", terminal_id: Terminal.second.id)
# r5 = Restaurant.create(name: "Peet's Coffee", terminal_id: Terminal.first.id)
# r6 = Restaurant.create(name: "Salata", terminal_id: Terminal.last.id)
# r7 = Restaurant.create(name: "Chipotle", terminal_id: Terminal.second.id)

20.times do
  Booking.create(
    user_id: User.all.sample.id, 
    flight_id: Flight.all.sample.id
  )
end

20.times do
  Restaurant.create(
    name: Faker::Restaurant.unique.name,
    terminal_id: Terminal.all.sample.id
  )
end