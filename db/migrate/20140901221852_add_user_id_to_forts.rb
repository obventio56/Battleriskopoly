class AddUserIdToForts < ActiveRecord::Migration
  def change
    add_column :forts, :user_id, :integer
  end
end
