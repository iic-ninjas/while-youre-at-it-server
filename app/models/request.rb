class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  has_one :location, through: :user

  enum :status [:pending, :declined, :approved, :settled, :canceled]
end
