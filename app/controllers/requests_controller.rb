class RequestsController < ApplicationController
  before_action :ensure_idle, only: [:create]
  before_action :ensure_can_respond, only: [:respond]
  before_action :ensure_can_change_status, only: [:destroy, :settle]

  def create
    request = current_user.create_request(request_params)
    current_user.requesting!
    render json: request
  end

  def destroy
    current_user.requests.last.canceled!
    current_user.idle!
    render json: current_user
  end

  def respond
    case given_response
      when :accept
        current_request.accepted!
      when :decline
        current_request.declined!
        current_user.idle!
    end
    render json: current_request
  end

  def settle
    current_request.settled!
    current_user.idle!
    render json: current_request
  end

  private

  def current_request
    @_request ||= Request.find(params.require(:request_id))
  end

  def request_params
    params.require(:requets).permit(:trip_id, :items, :price)
  end

  def given_response
    params.require(:response).to_sym
  end

  def ensure_idle
    unless current_user.idle?
      render 'You can not request now', :bad_request
    end
  end

  def ensure_can_respond
    if current_request.trip.shopper != current_user
      render 'You can not respond to this request', :forbidden
    end
  end

  def ensure_can_change_status
    if current_request.user != current_user
      render 'You can not change the status of this request', :forbidden
    end
  end
end
