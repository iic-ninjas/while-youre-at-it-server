class User < ActiveRecord::Base
  has_many :trips
  has_many :requests

  enum state: [:idle, :tripping, :requesting]

  def active_trip
    return nil unless self.tripping?
    self.trips.last
  end

  def active_request
    return nil unless self.requesting?
    self.requests.last
  end
end
