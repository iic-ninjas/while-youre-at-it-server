class TripSerializer < ActiveModel::Serializer
  has_one :shopper, serializer: ContactSerializer, root: false
  attributes :status

  def status
    object.shopper.tripping? ? 'active' : 'cancelled'
  end

end