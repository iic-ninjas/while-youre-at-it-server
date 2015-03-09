class ApplicationController < ActionController::Base
  include UserAuth
  include RenderingHelper

  protect_from_forgery with: :null_session

  before_action :require_user

  private 

  def require_user
    render_error 'User not singed in', :unauthorized unless user_signed_in?
  end
end
