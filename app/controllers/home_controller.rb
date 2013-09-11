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
    @registries = []
    #if params[:event].nil?
    #  @registries = LuxeRegistry.all
    #else
    #  event = Event.find_by_id params[:event]
    #  @registries = event.luxe_registries if event
    #end
    
    if params[:event].nil?
      @registries = Offer.all
    else
      event = Event.find_by_id params[:event]
      @registries = event.offers if event
    end

  end
end
