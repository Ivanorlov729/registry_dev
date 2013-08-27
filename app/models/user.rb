class User < ActiveRecord::Base 

  DRUPAL_HASH_COUNT = 15
  DRUPAL_MIN_HASH_COUNT = 7
  DRUPAL_MAX_HASH_COUNT = 30
  DRUPAL_HASH_LENGTH = 55

  has_many :luxe_registries

  has_many :orders
  has_many :payments
  has_many :subscriptions
  has_one :user_detail
  
  def authenticate password
  	cur_pass = self.pass
  	begin
  		password.present?
  	rescue BCrypt::Errors::InvalidHash
  		pass = _password_crypt(password, cur_pass)
  	end

  	return true if self.pass == pass
  end

  def id
  	self.uid
  end

  def _password_get_count_log2(setting)
    itoa64 = _password_itoa64()
    return itoa64.index(setting[3])
  end
  
  def _password_itoa64 
    return './0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
  end
  
  def _password_crypt(password, setting)
    # The first 12 characters of an existing hash are its setting string.
    setting = setting[0, 12]

    if setting[0] != '$' || setting[2] != '$'
      return false
    end
    count_log2 = _password_get_count_log2(setting)
    # Hashes may be imported from elsewhere, so we allow != DRUPAL_HASH_COUNT
    if count_log2 < DRUPAL_MIN_HASH_COUNT || count_log2 > DRUPAL_MAX_HASH_COUNT 
      return false
    end

    salt = setting[4, 8]
    # Hashes must have an 8 character salt.
    if (salt.length != 8) 
      return false
    end

    # Convert the base 2 logarithm into an integer.
    count = 1 << count_log2
    # We rely on the hash() function being available in PHP 5.2+.
    hash = Digest::SHA512.hexdigest(salt + password)

    begin 
      hash = Digest::SHA512.hexdigest(hash + password)
      count = count - 1
    end while (count > 0)

    len = hash.length
    output =  setting + _password_base64_encode(hash, len)

    len = (8 * len) / 6

    expected = 12 + len.to_i

    return (output.length == expected) ? output[0, DRUPAL_HASH_LENGTH] : false
  end


  def _password_base64_encode(input, count)    
    output = ''
    i = 0
    itoa64 = self._password_itoa64
    begin
      value = input[i].ord
      i=i+1
      output += itoa64[value & 0x3f]
      if i < count 
        value |= input[i].ord << 8
      end
      output += itoa64[(value >> 6) & 0x3f]
      
      i=i+1
      if i >= count
        break
      end
            
      if i < count 
        value |= input[i].ord << 16
      end
      output += itoa64[(value >> 12) & 0x3f]

      i=i+1      
      if i >= count
        break
      end
      
      output += itoa64[(value >> 18) & 0x3f]
     end while (i < count)
    return output
  end


end
