class User < ActiveRecord::Base 

  def authenticate password
  	
  	#begin
  	#	password.present?
  	#rescue BCrypt::Errors::InvalidHash
  	#	pass = Digest::MD5.hexdigest(password)
  	#end

  	return true if self.pass == pass
  end

  def id
  	self.uid
  end
end
