class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :balance_amount, :city, :country, :email, :first_name, :last_name, :method, :payment_option, :state, :token_key, :zip_code
end
