class Location < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :name, :presence => true
  validates :gps_lat, :presence => true
  validates :gps_long, :presence => true

end
