module RenderingHelper
  extend ActiveSupport::Concern

  def render_success
    render json: {success: true}
  end

  def render_error(message, status)
    render json: {success: false, error: message}, status: status
  end
end
