class ChangeSiteLatitudeLongitudeType < ActiveRecord::Migration[5.1]
  def change
  	change_column :sites, :latitude, :float, :precision=>10, :scale=>6 
  end
end
