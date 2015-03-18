class OutgoingRequestNotificationSerializer < ActiveModel::Serializer
  attributes :payload
  attributes :message
  attributes :notification_type

  def message
    if object.accepted?
      "#{object.trip.shopper.full_name} accepted your request!"
    elsif object.declined?
      "#{object.trip.shopper.full_name} declined your request"
    else
      nil
    end
  end

  def payload
    OutgoingRequestSerializer.new(object).as_json
  end

  def notification_type
    'outgoing_request_notification'
  end

end