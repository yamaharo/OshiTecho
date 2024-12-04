Rails.application.routes.draw do
  get "master/index"
  get "master/show"
  get "master/form"

  # get "auth/login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "main#home"

  # get "/login", to: redirect("https://<your_user_pool_domain>.auth.<region>.amazoncognito.com/oauth2/authorize?client_id=<your_client_id>&response_type=code&scope=openid&redirect_uri=<your_redirect_uri>")
  get "auth/callback", to: "auth#callback"
end
