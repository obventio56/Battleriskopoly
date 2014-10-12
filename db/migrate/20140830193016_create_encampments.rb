class CreateEncampments < ActiveRecord::Migration
  def change
    create_table :encampments do |t|
      t.string :name
      t.integer :user
      t.integer :territory
      t.string :date_created
      t.integer :xco
      t.integer :yco
      t.integer :troops

      t.timestamps
    end
  end
end
