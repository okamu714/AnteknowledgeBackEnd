class PurchaseHistoriesController < ApplicationController
  def create
    # `find_or_initialize_by`を使用してデータの重複をチェック
    purchase_history = PurchaseHistory.find_or_initialize_by(user_id: params[:user_id], product_id: params[:product_id])

    if purchase_history.persisted?
      # 既存データがある場合
      render json: { message: 'Purchase history already exists', data: purchase_history }, status: :ok
    elsif purchase_history.save
      # 新規データの保存が成功した場合
      render json: { message: 'Purchase history saved successfully', data: purchase_history }, status: :created
    else
      # 保存エラーが発生した場合
      render json: { error: 'Failed to save purchase history', details: purchase_history.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # before_action :authenticate_user! # ユーザーがログインしているか確認

  def user_purchases
    begin
      # ログインユーザーに関連付けられた購入履歴を取得
      user_id = params[:user_id]
      Rails.logger.info "Fetching purchase histories for user_id: #{user_id}"

      purchase_histories = PurchaseHistory.where(user_id: user_id)

      if purchase_histories.empty?
        render json: { message: 'No purchase histories found', data: [] }, status: :ok
      else
        render json: purchase_histories.map { |history|
          {
            product_id: history.product_id,
            purchased_at: history.created_at,
          }
        }
      end
    rescue StandardError => e
      Rails.logger.error "Error fetching purchase histories: #{e.message}"
      render json: { error: 'Internal server error' }, status: :internal_server_error
    end
  end

  private

  def purchase_history_params
    params.permit(:user_id, :product_id)
  end
end
