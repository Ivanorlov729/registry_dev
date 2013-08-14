class HomeController < ApplicationController
  def index
  end

  def find_registry  	
  end

  def find_registry_results  	
  	if request.post? or request.get?
  		@registries = LuxeRegistry.where(:first_name=>params[:f_name], :last_name=>params[:l_name]);
  	end
  end

  def schedule_consultation
  end
  
  def categories
    event = Event.find_by_id params[:event]
    @registries = event.luxe_registries
  end

  def registry_view
    @registry = LuxeRegistry.find(params[:id])
  end

  def purchase
    @offer = Offer.find_by_id params[:id]
  end
end
