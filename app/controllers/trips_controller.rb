class TripsController < ApplicationController
  before_action :ensure_idle, only: [:create]

  def create
    trip = current_user.trips.create
    current_user.tripping!
    render_success
  end

  def index
    users = User.tripping # needs location filter
    render json: users, each_serializer: ContactSerializer
  end

  def end_trip
    current_user.idle!
    render_success
  end

  private

  def ensure_idle
    unless current_user.idle?
      render_error 'You can not start a trip now', :bad_request 
    end
  end
end
