class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  attr_accessible :first_name, :last_name, :ccard_last4, :card_type, :exp_year, :exp_month, :email, :address, :optional_address, :city, :state, :zip_code, :price, :transaction_id

  validates :first_name, :last_name, :ccard_last4, :card_type, :exp_year, :exp_month, :email, :address, :optional_address, :city, :state, :zip_code, :price, :transaction_id, :presence => true


end