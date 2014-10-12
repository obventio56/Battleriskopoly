class Migrationuser < ActiveRecord::Migration
  def change
	remove_column :forts, :user
  end
end
