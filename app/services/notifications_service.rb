class NotificationsService

  @@gcm = GCM.new(ENV['GOOGLE_API_KEY'])

  def notify_request_created(request)
    request.trip.shopper
  end

  def self.register_user(user)
    registration_ids = user.devices.to_a.map(&:registration_id)
    return if registration_ids.blank?

    project_id = ENV['GOOGLE_PROJECT_ID']
    response = @@gcm.create(user.facebook_id, project_id, registration_ids)
    if response[:response] == 'success'
      notification_key = JSON.parse(response[:body])['notification_key']
    else
      error = JSON.parse(response[:body])['error']
      raise StandardError.new('Could not register user for notifications: ' + error)
    end
  end

end