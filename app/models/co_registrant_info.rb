class CoRegistrantInfo < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :daytime_phone, :email, :first_name, :last_name, :state, :use_regis_addr, :zipcode
  #validates :first_name, :last_name, presence: true
  validate :use_registrant_address

  def use_registrant_address  	
    if use_regis_addr.nil? or self.use_regis_addr == false
    	if address1.nil? or address1.blank?
    		errors.add(:address1, "Can't be blank")
    	end
    	
    	if city.nil? or city.blank?
    		errors.add(:city, "Can't be blank")
    	end

    	if daytime_phone.nil? or daytime_phone.blank?
    		errors.add(:daytime_phone, "Can't be blank")
    	end

    	if email.nil? or email.blank?
    		errors.add(:email, "Can't be blank")
    	end

    	if zipcode.nil? or zipcode.blank?
    		errors.add(:zipcode, "Can't be blank")
    	end
    end
  end
end
