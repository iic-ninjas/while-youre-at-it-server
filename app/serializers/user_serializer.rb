class UserSerializer < ActiveModel::Serializer
  attributes :facebook_id, :first_name, :last_name, :phone_number, :street_address, :city, :state
end
