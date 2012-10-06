class User < ActiveRecord::Base
  has_many :authentications
  has_many :notes, :dependent => :destroy
  has_one :qrcode, :dependent => :destroy
end
