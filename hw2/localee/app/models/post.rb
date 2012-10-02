class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  
  validates :location_id, :presence => true
  validates :user_id, :presence => true
  validates :text, :presence => true

  belongs_to :location
  belongs_to :user

  def to_hash
    {
      :author_id => self.user_id,
      :author => User.find_by_id(self.user_id).name,
      :text => self.text,
      :created_at => self.created_at,
      :location => Location.find_by_id(self.location_id).to_hash
    }
  end
end
