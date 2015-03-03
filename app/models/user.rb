class User < ActiveRecord::Base
  has_one :location
  has_many :trips
  has_many :requests
end
