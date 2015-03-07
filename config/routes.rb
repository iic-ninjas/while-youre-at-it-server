Rails.application.routes.draw do
  resources :users, only: [:create, :update]

  resources :trips, only: [:create, :index] do
    put 'end', to: :end_trip
  end

  resources :requests, only: [:create, :destroy] do
    put ':request_id/respond', to: :respond
    put ':request_id/settle', to: :settle
  end
end
