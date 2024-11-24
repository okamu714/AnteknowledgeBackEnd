# class ChargesController < ApplicationController
#   def create
#     begin
#       # フロントエンドから送信された金額を取得
#       amount = params[:amount]
#       Rails.logger.info("Received amount: #{amount}")

#       # StripeのPaymentIntentを作成
#       payment_intent = Stripe::PaymentIntent.create(
#         amount: amount,  # 金額（最小単位：1円単位）
#         currency: 'jpy' # 通貨
#       )
#       Rails.logger.info("PaymentIntent created successfully")

#       # クライアントにclient_secretを返す
#       render json: { client_secret: payment_intent.client_secret }, status: :ok
#     rescue Stripe::StripeError => e
#       # Stripe関連のエラー処理
#       Rails.logger.error("Stripe error: #{e.message}")
#       render json: { error: e.message }, status: :bad_request
#     end
#   end
# end
