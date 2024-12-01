class UserInfosController < ApplicationController
  def index
    user_infos = UserInfo.all
    render json: user_infos
  end

  # ユーザーを登録する
  def create
    # ユーザーが既に存在するか確認
    user_info = UserInfo.find_by(user_id: params[:user_id])

    if user_info
      render json: { message: 'User already exists. No further action taken.' }, status: :ok
    else
      # 新しいユーザーを作成
      user_info = UserInfo.new(user_id: params[:user_id], email: params[:email])

      if user_info.save
        render json: { message: 'User info saved successfully.' }, status: :ok
      else
        render json: { errors: user_info.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  # ユーザーの情報を見せる
  def show
    def show
      @user_info = UserInfo.find_by(user_id: params[:id])
      if @user_info
        render json: @user_info, status: :ok
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  end
end
