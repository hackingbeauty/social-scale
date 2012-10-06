class Note < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :body

  validates :title, :presence => true, :length => {:maximum => 255}
end
