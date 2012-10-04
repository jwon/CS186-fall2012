class Following < ActiveRecord::Base
  # attr_accessible :title, :body

  validates :user_id, :presence => true
  validates :location_id, :presence => true
  validates_uniqueness_of :user_id, :scope => [:location_id]

  # has_and_belongs_to_many :users
  belongs_to :locations
  belongs_to :users
  
end
