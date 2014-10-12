class ChangeEncampmentTerritory < ActiveRecord::Migration
  def change
	remove_column :encampments, :territory
	add_column :encampments, :territory, :string
  end
end
