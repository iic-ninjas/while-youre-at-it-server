class User < ActiveRecord::Base
  has_many :trips
  has_many :requests

  enum state: [:idle, :tripping, :requesting]
end
