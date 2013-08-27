class Subscription < ActiveRecord::Base
  belongs_to :luxe_registry
  belongs_to :user
  attr_accessible :subscribe, :luxe_registry_id
end
