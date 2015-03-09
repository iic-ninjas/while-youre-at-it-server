Rails.application.routes.draw do
  resources :users, only: [:create, :update]

  resources :trips, only: [:create, :index] do
    post 'end', to: :end_trip
  end

  resources :requests, only: [:create] do
    post 'cancel', to: :cancel
    post 'settle', to: :settle
    post ':request_id/accept', to: :accept
    post ':request_id/decline', to: :decline
  end
end
