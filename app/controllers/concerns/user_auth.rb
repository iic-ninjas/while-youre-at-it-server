module UserAuth
  extend ActiveSupport::Concern

  AUTH_HEADER_PARAM = 'X-WYAI-Token'

  def current_user
    @_current_user ||= User.find_by(auth_token: token_from_header)
  end

  def user_signed_in?
    current_user.present?
  end

  private 

  def token_from_header
    request.headers[AUTH_HEADER_PARAM]
  end
end
