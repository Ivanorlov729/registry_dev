class LuxeRegistriesController < ApplicationController
  before_filter :require_user

  # GET /luxe_registries
  # GET /luxe_registries.json

  def index
    @luxe_registries = LuxeRegistry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @luxe_registries }
    end
  end

  # GET /luxe_registries/1
  # GET /luxe_registries/1.json
  def show
    @luxe_registry = LuxeRegistry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @luxe_registry }
    end
  end

  # GET /luxe_registries/new
  # GET /luxe_registries/new.json
  def new
    @luxe_registry = LuxeRegistry.new
    @luxe_registry.build_registrant
    @luxe_registry.build_registrant_info
    @luxe_registry.build_co_registrant_info

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @luxe_registry }
    end
  end

  # GET /luxe_registries/1/edit
  def edit
    @luxe_registry = LuxeRegistry.find(params[:id])
  end

  # POST /luxe_registries
  # POST /luxe_registries.json
  def create
    @luxe_registry = LuxeRegistry.new(params[:luxe_registry])
    @luxe_registry.user_id = current_user.id

    @luxe_registry.build_registrant
    @luxe_registry.build_registrant_info
    @luxe_registry.build_co_registrant_info
    
    respond_to do |format|
      if @luxe_registry.save
        format.html { redirect_to luxe_registries_path, notice: 'Luxe registry was successfully created.' }
        format.json { render json: @luxe_registry, status: :created, location: @luxe_registry }
      else
        format.html { render action: "new" }
        format.json { render json: @luxe_registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /luxe_registries/1
  # PUT /luxe_registries/1.json
  def update
    @luxe_registry = LuxeRegistry.find(params[:id])

    respond_to do |format|
      if @luxe_registry.update_attributes(params[:luxe_registry])
        format.html { redirect_to @luxe_registry, notice: 'Luxe registry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @luxe_registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /luxe_registries/1
  # DELETE /luxe_registries/1.json
  def destroy
    @luxe_registry = LuxeRegistry.find(params[:id])
    @luxe_registry.destroy

    respond_to do |format|
      format.html { redirect_to luxe_registries_url }
      format.json { head :no_content }
    end
  end
end
