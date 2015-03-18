class NotificationSerializer < ActiveModel::Serializer
  attributes :payload
  attributes :message
  attributes :notification_type

  def message
    if object.pending?
      "Hey, #{object.user.full_name} sent you a shopping request!"
    elsif object.accepted?
      "#{object.trip.shopper.full_name} accepted your request!"
    elsif object.declined?
      "#{object.trip.shopper.full_name} declined your request"
    else
      nil
    end
  end

  def payload
    IncomingRequestSerializer.new(object).as_json
  end

  def notification_type
    'shop_request_notification'
  end

end