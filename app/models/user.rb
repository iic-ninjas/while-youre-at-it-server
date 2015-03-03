class User < ActiveRecord::Base
  has_one :location
  has_many :trips
  has_many :requests

  accepts_nested_attributes_for :location
end
