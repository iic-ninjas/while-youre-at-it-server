class UsersController < ApplicationController
  skip_before_action :require_user, only: [:create]

  def create
    if @user = User.find_by(facebook_id: user_params[:facebook_id])
      @user.update(user_params)
    else
      @user = User.create(user_params)
    end
    render json: @user
  end

  def update
    @user = current_user.update(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:facebook_id, :first_name, :last_name, :phone_number, :street_address, :city)
  end
end
