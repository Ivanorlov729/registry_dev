class CoRegistrantInfo < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :daytime_phone, :email, :first_name, :last_name, :state, :use_regis_addr, :zipcode
  validates :first_name, :last_name, :address1, :city, :state, :zipcode, :daytime_phone, :email, :presence => true
end
