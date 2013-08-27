class Offer < ActiveRecord::Base
  attr_accessible :amount, :details, :location, :merchant, :overview, :summary, :title, 
  								:images_attributes, :offer_events_attributes

  validates :title, :presence => true

  belongs_to :luxe_registry

  has_many :images, :as => :imageable, :dependent => :destroy
	
	has_many :offer_events
  has_many :events, :through => :offer_events


  accepts_nested_attributes_for :images, :allow_destroy=>true, :reject_if => :all_blank
  accepts_nested_attributes_for :offer_events, :allow_destroy=>true, :reject_if => proc{ |a| a['event_id'] == '-1' }



  def merchant_image
  	self.images.first.picture
  end
  def slider_image
  	self.images.second.picture
  end
  def price
  	ActionController::Base.helpers.number_to_currency(self.amount)
  end
end
