class Location < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :name, :presence => true
  validates :gps_lat, :presence => true
  validates :gps_long, :presence => true

  has_many :posts

  def to_hash
    {
      :id => self.id,
      :name => self.name,
      :latitude => self.gps_lat,
      :longitude => self.gps_long
    }
  end
end
