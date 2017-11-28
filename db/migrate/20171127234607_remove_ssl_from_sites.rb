class RemoveSslFromSites < ActiveRecord::Migration[5.1]
  def up
  	remove_column :sites, :ssl
  end

  def down
  	add_column :sites, :ssl, :boolean
  end
end
