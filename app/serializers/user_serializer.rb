class UserSerializer < ActiveModel::Serializer
  attributes :facebook_id, :first_name, :last_name, :street_address, :city, :latitude, :longitude, :phone_number, :state
end
