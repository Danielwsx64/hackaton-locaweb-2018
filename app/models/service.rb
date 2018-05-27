class Service < ApplicationRecord
  has_many :additionals
  has_many :related_services, through: :additionals, class_name: 'Service'
end
