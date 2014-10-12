class RemoveUserFromEncampmentsAndAddUserId < ActiveRecord::Migration
  def change
	remove_column :encampments, :user
	add_column :encampments, :user_id, :integer
  end
end
