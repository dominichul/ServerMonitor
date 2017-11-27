class ChangeSiteLongitudeType < ActiveRecord::Migration[5.1]
  def change
  	remove_column :sites, :longitude
  	add_column :sites, :longitude, :float, :precision=>10, :scale=>6 
  end
end
