class CreateTerminals < ActiveRecord::Migration[6.0]
  def change
    create_table :terminals do |t|
      t.string :number
      t.string :airport
      t.string :iata
      t.timestamps
    end
  end
end
