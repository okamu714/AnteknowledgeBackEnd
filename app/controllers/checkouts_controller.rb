class CheckoutsController < ApplicationController
  require "stripe"

  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

  def create_checkout_session
    begin
      prodct_id = params[:product_id]
      product_name = params[:product_name]
      price= params[:price]
      userId= params[:userId]

 
      session = Stripe::Checkout::Session.create(
        payment_method_types: ["card"],
        line_items: [
          {
            price_data: {
              currency: "jpy",
              product_data: { name: product_name },
              unit_amount: price
            },
            quantity: 1
          }
        ],
        mode: "payment",
        metadata: {
          product_id: prodct_id,  # 商品ID
          product_name: product_name, # 本の名前
          userId: userId, #amplifyのユーザーId
        },
        success_url: "https://authcomp.d1awsv4v0mkqab.amplifyapp.com/succes?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: "https://authcomp.d1awsv4v0mkqab.amplifyapp.com/cancel"
      )
  
      Rails.logger.info("Checkout session created: #{session.id}")
      render json: { id: session.id }, status: :ok
    rescue => e
      Rails.logger.error("Stripe Error: #{e.message}")
      render json: { error: "Failed to create Checkout session" }, status: :internal_server_error
    end
  end
  
end  