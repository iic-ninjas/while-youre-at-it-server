Rails.application.routes.draw do
  scope '/users', controller: :users do
    post '/login', to: :login
    post '/update', to: :update
  end

  scope '/trips', controller: :trips do
    get '/', to: :index
    post '/create', to: :create
    post '/end', to: :end_trip
  end

  scope '/requests', controller: :shop_requests do
    get '/', to: :index
    post '/create', to: :create
    post '/cancel', to: :cancel
    post '/settle', to: :settle
    post ':request_id/accept', to: :accept
    post ':request_id/decline', to: :decline
  end
end
