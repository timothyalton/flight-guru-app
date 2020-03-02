class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :ticket_number
      t.integer :user_id
      t.integer :flight_id
      
      t.timestamps
    end
  end
end
