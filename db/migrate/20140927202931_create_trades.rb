class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :what
      t.integer :quantity
      t.integer :cost
      t.integer :user_id
      t.integer :fort_id

      t.timestamps
    end
  end
end
