class ShopRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  enum status: [:pending, :declined, :accepted, :settled, :canceled]
end
