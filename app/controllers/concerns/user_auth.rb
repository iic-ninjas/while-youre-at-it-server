module UserAuth
  extend ActiveSupport::Concern

  AUTH_HEADER_PARAM = 'X-WYAI-FBID'

  def current_user
    @_current_user ||= User.find_by(facebook_id: fbid_from_header)
  end

  def user_signed_in?
    current_user.present?
  end

  private 

  def fbid_from_header
    request.headers[AUTH_HEADER_PARAM]
  end
end
