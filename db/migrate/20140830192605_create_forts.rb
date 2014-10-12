class CreateForts < ActiveRecord::Migration
  def change
    create_table :forts do |t|
      t.string :name
      t.integer :user
      t.integer :xco
      t.integer :yco
      t.float :ownership
      t.integer :territory
      t.string :date_created
      t.integer :trained_troops
      t.integer :untrained_troops
      t.integer :jeeps
      t.integer :blackhawks
      t.integer :cargo_aircraft
      t.integer :tanks
      t.integer :flagpoles
      t.integer :patrol_boats
      t.integer :cruisers
      t.integer :destroyers
      t.integer :submarines
      t.integer :battleships
      t.integer :aircraft_carriers
      t.integer :energy_units
      t.integer :food_units

      t.timestamps
    end
  end
end
