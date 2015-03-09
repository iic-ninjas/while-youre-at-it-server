class ContactSerializer < ActiveModel::Serializer
  root :contact
  
  attributes :facebook_id, :first_name, :last_name, :street_address, :city, :phone_number
end
