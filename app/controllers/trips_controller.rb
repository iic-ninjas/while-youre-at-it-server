class TripsController < ApplicationController
  before_action :ensure_idle, only: [:create]

  def create
    trip = current_user.create_trip
    current_user.tripping!
    render json: trip
  end

  def index
    render json: Trip.active.all # needs loaction based filter
  end

  def end_trip
    current_user.idle!
    render json: current_user
  end

  private

  def ensure_idle
    unless current_user.idle?
      render_error 'You can not start a trip now', :bad_request 
    end
  end
end
