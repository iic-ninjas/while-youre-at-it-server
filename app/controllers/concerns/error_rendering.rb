module ErrorRendering
  extend ActiveSupport::Concern

  def render_error(message, status)
    render json: {error: message}, status: status
  end
end
