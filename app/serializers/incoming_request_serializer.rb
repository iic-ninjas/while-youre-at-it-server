class IncomingRequestSerializer < ActiveModel::Serializer
  attributes :id, :requester, :status, :items, :offer

  def requester
    ContactSerializer.new(object.user, root: false)
  end
end
