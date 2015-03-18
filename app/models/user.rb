class User < ActiveRecord::Base
  has_many :trips, foreign_key: 'shopper_id'
  has_many :shop_requests
  has_many :devices

  enum state: [:idle, :tripping, :requesting]

  def active_trip
    return nil unless self.tripping?
    self.trips.last
  end

  def active_request
    return nil unless self.requesting?
    self.shop_requests.last
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
