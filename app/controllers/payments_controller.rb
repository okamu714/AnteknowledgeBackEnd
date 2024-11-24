# class PaymentController < ApplicationController
#   def create
#     payment_intent = Stripe::PaymentIntent.create(
#       amount: params[:amount],
#       currency: 'jpy'
#     )
#     render json: { client_secret: payment_intent.client_secret }
#   end
# end
