class TripsController < ApplicationController
  before_action :ensure_no_active_trip, only: [:create]
  before_action :ensure_active_trip, only: [:stop_accepting_requests, :finish_trip]

  def create
    @trip = current_user.create_trip
    render json: @trip
  end

  def stop_accepting_requests
    @trip = current_user.trips.active.first
    @trip.not_accepting_requests!
    render json: @trip
  end

  def finish_trip
    @trip = current_user.trips.active.first
    @trip.ended!
    render json: @trip
  end

  private

  def ensure_no_active_trip
    if current_user.trips.not_ended.any?
      render_error 'You are already on a trip', :bad_request 
    end
  end

  def ensure_active_trip
    if current_user.trips.not_ended.empty?
      render_error 'You do not have any active trips', :bad_request
    end
  end
end
