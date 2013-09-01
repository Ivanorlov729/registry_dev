class PaymentController < ApplicationController
	def new
		@order = current_user.orders.build
	end
	
	def checkout
		@order = current_user.orders.build
		
		offer = Offer.find_by_id session[:current_offer]
		redirect_to :back if offer.nil?
		

		tel_num = params[:tel_number].join("-")
		params[:order][:tel_number] = tel_num
		params[:order][:balance_amount] = offer.amount

		#render :text=>params.inspect and return

		@order.attributes = params[:order]
		
		amount = @order.price_in_cents
		credit_card = ActiveMerchant::Billing::CreditCard.new(
			:number								=>params[:card_number],
			:verification_value		=>params[:security_code],
			:month								=>params[:exp_month],
			:year									=>params[:exp_year],
			:first_name						=>params[:order][:first_name],
			:last_name						=>params[:order][:last_name]
		)


		if credit_card.valid?
			purchase_options= {
				:ip => request.remote_ip,
				:billing_address => {
					# :company	=> current_user.company_name,
					:first_name => params[:order][:first_name],
					:last_name => params[:order][:last_name],
					:address1 => params[:order][:address],
					:city		 => params[:order][:city],
					:state		=> params[:order][:state],
					:country	=> params[:order][:country],
					:zip			=> params[:order][:zip_code]
				}
			}
	
			#response = GATEWAY.authorize(amount_in_cents, credit_card)
			# puts amount_in_cents, credit_card.inspect, purchase_options
			response = GATEWAY.purchase(amount, credit_card, purchase_options)
			# puts response.inspect
			
			# render :text=>response.inspect and return
			if response.success?
				@order.token_key = response.params["transaction_id"]
				@order.payment_option = 'card'
				#@order.balance_amount = @order.calculate_price.fractional
				if @order.save && @order.complete(credit_card)
					session[:order_id] = nil
					flash[:notice] = t('controllers.payment_process.update.success')
					redirect_to root_url and return
				end
			else
				@order.errors.add(:base, t('controllers.payment_process.update.card_error', :msg => (response.message || 'Unknown error')))
				# raise StandardError, response.message
			end

		else
			flash[:notice] = credit_card.errors.full_messages.join('. ')
		end		
		respond_to do |format|
			format.html { render action: "new" }
			format.json { render json: @order.errors, status: :unprocessable_entity }
		end
		return
	end

	def purchase
		render :text => params.inspect and return
		
		
		respond_to do |format|
			format.html { render action: "purchase" }
			format.json { render json: @order.errors, status: :unprocessable_entity }
		end

		return
	end
end
