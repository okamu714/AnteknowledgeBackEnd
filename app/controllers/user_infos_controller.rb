class UserInfosController < ApplicationController
  def index
    @user_infos = UserInfo.all
    render json: @user_infos
  end

  def create
    user_info = UserInfo.find_by(user_id: user_info_params[:user_id])

    if user_info
      render json: { message: 'User already exists. No further action taken.' }, status: :ok
    else
      user_info = UserInfo.new(user_info_params)

      if user_info.save
        render json: { message: 'User info saved successfully.' }, status: :ok
      else
        render json: { errors: user_info.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def show
    @user_info = UserInfo.find_by(user_id: params[:id])
    if @user_info
      render json: @user_info, status: :ok
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private

  def user_info_params
    params.require(:user_info).permit(:user_id, :email)
  end
end
