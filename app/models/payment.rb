class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  attr_accessible :first_name, :last_name, :card_number, :exp_date, :secur_code, :telephone, :email, :means_contact, :address1, :address2, :city, :state, :zip_code, :price, :transaction_id

  validates :first_name, :last_name, :card_number, :exp_date, :secur_code, :email, :address1, :city, :state, :zip_code, :presence => true

end