class OfferEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :offer
  
  attr_accessible :event_id, :offer_id
end
