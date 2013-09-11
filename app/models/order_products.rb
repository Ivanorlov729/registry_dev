class OrderProducts < ActiveRecord::Base
  belongs_to :order
  belongs_to :offer
  # attr_accessible :title, :body
  validates_presence_of :order_id, :offer_id  
end
