class FixUsersOnLegs < ActiveRecord::Migration
  def change
	remove_column :legs, :user_id
	add_column :legs, :sending_user_id, :integer
	add_column :legs, :recipient_user_id, :integer
  end
end
