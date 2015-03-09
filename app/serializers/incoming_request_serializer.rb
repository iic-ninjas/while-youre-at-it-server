class IncomingRequestSerializer < ActiveModel::IncomingRequestSerializer
  attributes :requester, :status, :items, :offer

  def requester
    object.user
  end
end
