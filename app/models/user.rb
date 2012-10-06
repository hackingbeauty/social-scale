class User < ActiveRecord::Base
  has_many :authentications
  has_many :notes, :dependent => :destroy
end
