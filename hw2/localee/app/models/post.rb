class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  
  validates :location_id, :presence => true
  validates :user_id, :presence => true
end
