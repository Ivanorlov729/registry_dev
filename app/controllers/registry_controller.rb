class RegistryController < ApplicationController
	before_filter :require_user
  
	def registry_view
    @registry = LuxeRegistry.find(params[:id])
  end

  def purchase
    @offer = Offer.find_by_id params[:id]
  end

  def manage_registry
  end
  def subscriptions
  end
  def account_settings
    @user_detail = current_user.user_detail
    if request.post? || request.put?     
      @user_detail = current_user.build_user_detail if current_user.user_detail.blank?
      @user_detail.first_name = params[:f_name]
      @user_detail.last_name = params[:l_name]
      @user_detail.zip_code = params[:z_code]
      @user_detail.save
      #render :text => user_detail.inspect and return
    end
    @user_detail = current_user.build_user_detail if current_user.user_detail.blank?
  end

  def new_payment
    if request.post? || request.put?
      @payment = @payment = current_user.payments.build(params[:payment])
      #render :text => @payment.inspect and return
      redirect_to :action => :account_settings and return
    end
    @payment ||= Payment.new
  end

	
	def registry_list
    @offer = Offer.find_by_id(params[:id])
    @registries = current_user.luxe_registries
  end

	def add_registry    
    @offer = Offer.find_by_id(params[:registry][:offer_id])
    @registry = current_user.luxe_registries.find_by_id(params[:registry][:luxe_registry_id])
    if @offer.present? and @registry.present?
      @offer.luxe_registry_id = @registry.id
      if @offer.save
        flash[:notice] = "Successfully added"
        redirect_to :back
      else
        flash[:notice] = "Please check again"
        redirect_to offers_path
      end
    else
      flash[:notice] = "Please check again"
      redirect_to offers_path
    end
	end

  def update_subscription
    if params[:subscription][:all_registry].present? and params[:subscription][:all_registry] == 'yes'
      LuxeRegistry.all.each do |registry|
        subscription = current_user.subscriptions.find_by_id registry.id
        if subscription.present?
          subscription.subscribe = true
        else
          subscription = current_user.subscriptions.build(:luxe_registry_id => registry.id, :subscribe=>true)  
        end        
        subscription.save
      end
    else
      current_user.subscriptions.each do |subscription|
        subscription.destroy
      end
      params[:subscription][:luxe_registry_ids].each do |registry|
        subscription = current_user.subscriptions.build(:luxe_registry_id => registry, :subscribe=>true)
        subscription.save
      end
    end
    redirect_to root_url
  end
end
