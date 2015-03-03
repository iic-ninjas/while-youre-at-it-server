class RequestsController < ApplicationController
  before_action :ensure_no_active_requests, only: [:create]

  def create
    request = current_user.create_request(request_params)
    render json: request
  end

  def respond
    case response.to_sym
      when :accept then current_request.accepted!
      when :decline then current_request.declined!
    end
    render json: current_request
  end

  def settle
    current_request.settled!
    render json: current_request
  end

  private

  def current_request
    @_request ||= Request.find(params.require(:request_id))
  end

  def request_params
    params.require(:requets).permit(:trip_id, :items, :price)
  end

  def response
    params.require(:response)
  end

  def ensure_no_active_requests
    if current_user.request.active.any?
      render 'You already have pending requests', :bad_request
    end
  end
end
