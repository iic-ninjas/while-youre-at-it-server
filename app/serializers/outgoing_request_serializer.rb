class OutgoingRequestSerializer < ActiveModel::Serializer
  attributes :id, :shopper, :status, :items, :offer

  def shopper
    ContactSerializer.new(object.trip.shopper, root: false)
  end
end
