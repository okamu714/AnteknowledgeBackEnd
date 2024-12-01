# class WebhooksController < ApplicationController
#   skip_before_action :verify_authenticity_token

#   def stripe
#     payload = request.body.read
#     sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
#     endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_secret)

#     begin
#       event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)

#       case event["type"]
#       when "checkout.session.completed"
#         handle_checkout_session_completed(event["data"]["object"])
#       end
#     rescue JSON::ParserError => e
#       render json: { error: "Invalid payload" }, status: :bad_request
#       return
#     rescue Stripe::SignatureVerificationError => e
#       render json: { error: "Invalid signature" }, status: :bad_request
#       return
#     end

#     render json: { message: "Webhook received" }, status: :ok
#   end

#   private

#   def handle_checkout_session_completed(session)
#     user_id = session.metadata.user_id
#     product_id = session.metadata.product_id
#     price = session.amount_total

#     Purchase.create!(
#       user_id: user_id,
#       product_id: product_id,
#       stripe_payment_intent_id: session.payment_intent,
#       price: price,
#       currency: "jpy"
#     )
#   end
# end
