class StripeSessionsController < ApplicationController
  require 'stripe'

  Stripe.api_key = ENV['STRIPE_LIVE_SECRET_KEY']

  def show_stripe_session
    session_id = params[:id]
    Rails.logger.info("Received session_id: #{session_id}") # ログ出力で確認

    begin
      # Stripeセッション情報を取得
      session = Stripe::Checkout::Session.retrieve(session_id)
      render json: { metadata: session.metadata }
    rescue Stripe::StripeError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
