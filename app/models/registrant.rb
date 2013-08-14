class Registrant < ActiveRecord::Base
  attr_accessible :before_this_date, :co_regis_addr1, :co_regis_addr2, :password_confirmation, :password, :receive_gifts, :regis_addr1, :regis_addr2
  attr_accessor :password
	
	validates :password, :password_confirmation, :presence => true
  validates :password, :length => { in: 8..12 }, 
  										 :confirmation => true
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, :if => :password_change
end
