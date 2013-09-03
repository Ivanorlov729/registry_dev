class RegistrantInfo < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :daytime_phone, :email, :first_name, :last_name, :state, :zipcode

  validates_presence_of :first_name, :last_name, :address1, :city, :state, :zipcode, :daytime_phone, :email
end
