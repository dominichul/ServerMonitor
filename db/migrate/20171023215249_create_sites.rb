class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :owner
      t.string :name
      t.string :ipaddress
      t.string :latitude
      t.string :longitude
      t.string :description
      t.string :callout
      t.datetime :lastchecked
      t.boolean :ssl
      t.boolean :status

      t.timestamps
    end
  end
end
