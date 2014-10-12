class RemoveAndAddTerritoryToFort < ActiveRecord::Migration
  def change
	remove_column :forts, :territory, :integer
	add_column :forts, :territory, :string
  end
end
