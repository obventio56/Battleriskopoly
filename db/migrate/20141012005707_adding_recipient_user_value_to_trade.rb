class AddingRecipientUserValueToTrade < ActiveRecord::Migration
  def change
	remove_column :trades, :user_id
	add_column :trades, :sending_user_id, :integer
	add_column :trades, :recipient_user_id, :integer
  end
end
