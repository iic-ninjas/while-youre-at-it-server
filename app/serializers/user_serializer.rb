class UserSerializer < ActiveModel::Serializer
  attributes :facebook_id, :first_name, :last_name, :street_adress, :city, :phone_number
end
