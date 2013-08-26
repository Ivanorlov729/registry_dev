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
    @registries = current_user.luxe_registries
  end
	def add_registry
	end

end
