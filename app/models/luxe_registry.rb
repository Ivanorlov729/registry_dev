class LuxeRegistry < ActiveRecord::Base
  attr_accessible :user_id, :event_id, :event_date, :first_name, :last_name, :phone,
  								:registrant_attributes, :registrant_info_attributes, :co_registrant_info_attributes

  belongs_to :user
  belongs_to :event
  
  has_one :registrant, 					:dependent => :destroy
  has_one :registrant_info,			:dependent => :destroy
  has_one :co_registrant_info,	:dependent => :destroy
  
  has_one :subscription

  has_many :offers

  accepts_nested_attributes_for :registrant, 					:allow_destroy=>true, :reject_if => :all_blank
  accepts_nested_attributes_for :registrant_info, 		:allow_destroy=>true, :reject_if => :all_blank
  accepts_nested_attributes_for :co_registrant_info, 	:allow_destroy=>true, :reject_if => :all_blank

  validates :user_id, :event_id, :event_date, :presence => true;

  def registrant_name
  	[self.registrant_info.first_name, self.registrant_info.last_name].reject(&:blank?).join(" ")
  end
  def co_registrant_name
  	[self.co_registrant_info.first_name, self.co_registrant_info.last_name].reject(&:blank?).join(" ")
  end
  
  def event_name
    self.event.name
  end
end
