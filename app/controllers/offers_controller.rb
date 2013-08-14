class OffersController < InheritedResources::Base
	
	def new
		@offer = Offer.new
		@offer.images.build
		super
	end

	def create
		@offer = Offer.new(params[:offer])
    #@offer.user_id = current_user.id
    respond_to do |format|
      if @offer.save
        format.html { redirect_to action: "index", notice: 'Offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
		super		
	end

end
