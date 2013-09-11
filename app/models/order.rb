class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :optional_address, :balance_amount, :city, :country, :email, :first_name, :last_name, 
  								:method, :payment_option, :state, :token_key, :zip_code, :tel_number, :is_telephone, :is_email
	
	validates_presence_of :first_name, :last_name, :email, :address, :optional_address, :city, :state, :zip_code
	
	has_one :payment,               :dependent => :destroy
  has_one :order_products
  has_one :offer,                 :through => :order_products

	def price_in_cents
    self.balance_amount.to_i * 100
  end

  def price
  	self.balance_amount
  end
  
  def amount_balance
    ActionController::Base.helpers.number_to_currency(self.balance_amount)
  end
  
  def complete(card)
  	payment_transaction 									= self.build_payment
    payment_transaction.user_id 					= self.user_id
    payment_transaction.first_name				= self.first_name
    payment_transaction.last_name					= self.last_name
    payment_transaction.ccard_last4				= card.last_digits
    payment_transaction.card_type					= card.brand
    payment_transaction.exp_year					= card.year
    payment_transaction.exp_month					= card.month
    payment_transaction.email 						= self.email
    payment_transaction.address 					= self.address
    payment_transaction.optional_address 	= self.optional_address
    payment_transaction.city 							= self.city
    payment_transaction.state 						= self.state
    payment_transaction.zip_code 					= self.zip_code
    payment_transaction.price 						= self.price
    payment_transaction.transaction_id 		= self.token_key

    payment_transaction.save
	end
end
