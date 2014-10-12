class CreateLegs < ActiveRecord::Migration
  def change
    create_table :legs do |t|
      t.string :what
      t.integer :quantity
      t.string :durration

      t.timestamps
    end
  end
end
