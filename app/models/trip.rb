class Trip < ActiveRecord::Base
  belongs_to :shopper, class_name: 'User'
  has_many :requests
end
