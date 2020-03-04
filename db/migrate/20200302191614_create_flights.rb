class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :airline
      t.string :departing_ap
      t.string :arrival_ap
      t.string :date
      t.string :departure_time
      t.string :arrival_time
      t.integer :terminal_id
      t.timestamps
    end
  end
end
