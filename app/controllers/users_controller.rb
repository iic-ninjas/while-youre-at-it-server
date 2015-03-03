class UsersController < ApplicationController
  skip_before_action :require_user, only: [:create]

  def create
    if @user = User.find_by(facebook_id: user_params[:facebook_id])
      @user.update(user_params)
    else
      @user = User.create(user_params)
    end
    sign_in(@user)
    render json: @user
  end

  def update
    @user = current_user.update(user_params)
    render json: @user
  end

  private

  def user_params
    permitted_params = params.require(:user).permit(:facebook_id, :name, :phone_number, :paypal_account)
    permitted_params[:location_attributes] = params.require(:user).require(:location).permit(:street_address, :city, :country)
    permitted_params
  end
end
