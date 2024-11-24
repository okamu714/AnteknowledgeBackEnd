class CheckoutController < ApplicationController
  def create
    begin
      # リクエストデータを解析
      items = params[:items] || []

      amount = items.sum { |item| item['amount'].to_i }

      # PaymentIntentを作成
      payment_intent = Stripe::PaymentIntent.create(
        amount: amount,
        currency: 'jpy',
        payment_method_types: ['card'] 
      )

      # clientSecretを返す
      render json: { clientSecret: payment_intent.client_secret }, status: :ok
    rescue Stripe::StripeError => e
      # Stripeエラーの処理
      render json: { error:"Payment error: #{e.message}"}, status: :bad_request

    rescue => e
      # その他のエラー処理
      render json: { error: "Internal Server Error: #{e.message}" }, status: :internal_server_error
    end
  end
end
