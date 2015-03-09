class OutgoingRequestSerializer < ActiveModel::Serializer
  attributes :shopper, :status, :items, :offer

  def shopper
    ContactSerializer.new(object.trip.shopper, root: false)
  end
end
