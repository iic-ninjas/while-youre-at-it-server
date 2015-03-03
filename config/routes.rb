Rails.application.routes.draw do
  rescources :users, only: [:create, :update]

  rescources :trips, only: [:create] do
    put ':trip_id/stop_accepting_request', to: :stop_accepting_request
    put ':trip_id/end', to: :end_trip
  end

  rescources :requests, only: [:create] do
    put ':request_id/respond', to: :respond
    put ':request_id/settle', to: :settle
  end
end
