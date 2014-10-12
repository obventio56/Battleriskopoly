class AddIdsToLegs < ActiveRecord::Migration
  def change
	add_column :legs, :user_id, :integer
	add_column :legs, :fort_id, :integer
  end
end
