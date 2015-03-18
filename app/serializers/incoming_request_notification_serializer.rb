class IncomingRequestNotificationSerializer < ActiveModel::Serializer
  attributes :payload
  attributes :message
  attributes :notification_type

  def message
    if object.pending?
      "Hey, #{object.user.full_name} sent you a shopping request!"
    else
      nil
    end
  end

  def payload
    IncomingRequestSerializer.new(object).as_json
  end

  def notification_type
    'incoming_request_notification'
  end

end