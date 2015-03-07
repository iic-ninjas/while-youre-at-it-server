Rails.application.routes.draw do
  resources :users, only: [:create, :update]

  resources :trips, only: [:create, :index] do
    put ':trip_id/stop_accepting_request', to: :stop_accepting_request
    put ':trip_id/end', to: :end_trip
  end

  resources :requests, only: [:create] do
    put ':request_id/respond', to: :respond
    put ':request_id/settle', to: :settle
  end
end
