class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :gps_lat
      t.float :gps_long
      t.timestamps
    end
  end
end
