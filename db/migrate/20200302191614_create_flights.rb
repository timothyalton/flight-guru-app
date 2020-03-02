class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :number
      t.integer :terminal_id
      t.timestamps
    end
  end
end
