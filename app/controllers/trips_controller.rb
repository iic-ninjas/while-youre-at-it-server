class TripsController < ApplicationController
  before_action :ensure_no_active_trip, only: [:create]
  before_action :ensure_active_trip, only: [:stop_accepting_requests, :finish_trip]

  def create
    @trip = current_user.create_trip
    render json: @trip
  end

  def stop_accepting_requests
    current_trip.not_accepting_requests!
    render json: current_trip
  end

  def finish_trip
    current_trip.ended!
    render json: current_trip
  end

  private

  def current_trip
    @_trip ||= current_user.trips.find(params.require(:trip_id))
  end

  def ensure_no_active_trip
    if current_user.trips.not_ended.any?
      render_error 'You are already on a trip', :bad_request 
    end
  end

  def ensure_active_trip
    if current_trip.ended?
      render_error 'This trip has already ended', :bad_request
    end
  end
end
