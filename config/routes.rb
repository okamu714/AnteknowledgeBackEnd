Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # resources :users

  # ユーザー情報用
  resources :user_infos
  get '/user_infos/:user_id', to: 'user_infos#show'

  # 購入履歴用
  # resources :purchase_histories

  resources :purchase_histories
  get 'user_purchase_histories', to: 'purchase_histories#user_purchases'

 
  

  # stripe用   
  resources :stripe_sessions, only: [:show]
  post "/create-checkout-session", to: "checkouts#create_checkout_session"
  post "/webhook", to: "webhooks#stripe"
  get '/api/stripe/:id', to: 'stripe_sessions#show_stripe_session'
  


  
  

end
