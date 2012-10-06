class User < ActiveRecord::Base
  has_many :authentications
  has_one :qrcode, :dependent => :destroy
end
