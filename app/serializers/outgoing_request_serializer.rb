class OutgoingRequestSerializer < ActiveModel::Serializer
  attributes :shopper, :status, :items, :offer

  def shopper
    object.trip.shopper
  end
end
