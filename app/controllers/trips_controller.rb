class TripsController < ApplicationController
  before_action :ensure_idle, only: [:create]

  def create
    trip = current_user.trips.create
    current_user.tripping!
    NotificationsService.notify_users_on_trip(trip)
    render_success
  end

  def index
    users = User.tripping # needs location filter
    render json: users, each_serializer: ContactSerializer, root: false
  end

  def end_trip
    current_user.idle!
    NotificationsService.notify_users_on_trip(current_user.trips.last)
    render_success
  end

  private

  def ensure_idle
    unless current_user.idle?
      render_error 'You can not start a trip now', :bad_request 
    end
  end
end
