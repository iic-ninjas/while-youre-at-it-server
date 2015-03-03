module UserAuth
  extend ActiveSupport::Concern

  AUTH_HEADER_PARAM = 'X-WYAI-Token'

  def current_user
    @_current_user ||= User.find_by(auth_token: token_from_header)
  end

  def user_signed_in?
    current_user.present?
  end

  def sign_in(user)
    user.update(auth_token: SecureRandom.urlsafe_base64)
    @_current_user = user
  end

  def sign_out
    current_user.update(auth_token: nil)
    @_current_user = nil
  end

  private 

  def token_from_header
    request.headers[AUTH_HEADER_PARAM]
  end
end
