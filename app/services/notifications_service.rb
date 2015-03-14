class NotificationsService

  gcm = GCM.new(ENV['GOOGLE_API_KEY'])

  def notify_request_created(request)
    request.trip.shopper
  end

end