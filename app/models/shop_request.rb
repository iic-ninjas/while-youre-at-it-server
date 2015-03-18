class ShopRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  enum status: [:pending, :declined, :accepted, :settled, :canceled]
  scope :can_be_declined, -> { where(status: [ShopRequest.statuses[:pending], ShopRequest.statuses[:accepted]]) }

end
