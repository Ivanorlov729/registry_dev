class Event < ActiveRecord::Base
  attr_accessible :name
  has_many :luxe_registries, 										:dependent => :destroy

  has_many :offer_events
  has_many :offers, :through => :offer_events
end
