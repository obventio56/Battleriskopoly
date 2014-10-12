class RemoveTradeValuesFromTrade < ActiveRecord::Migration
  def change
	remove_column :trades, :what
	remove_column :trades, :quantity
	remove_column :trades, :fort_id
	add_column :trades, :sending_fort_id, :integer
	add_column :trades, :recipient_fort_id, :integer
  end
end
