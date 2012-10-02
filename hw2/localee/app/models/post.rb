class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  
  validates :location_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :location
  belongs_to :user

  def to_hash
    {
      :author_id => self.user_id,
      :author => self.user.name,
      :text => self.text
      :created_at => self.created_at
      :location => self.location.to_hash
    }
end
