class TripNotificationSerializer < ActiveModel::Serializer
  attributes :notification_type
  attributes :message
  attributes :payload

  def message
    if object.shopper.tripping?
      "Your friend #{object.shopper.full_name} is going shopping and willing to take requests."
    else
      "#{object.shopper.full_name} decided to cancel his shopping trip :("
    end
  end

  def payload
    TripSerializer.new(object).as_json
  end

  def notification_type
    'trip_notification'
  end
end