require "spec_helper"

describe LuxeRegistriesController do
  describe "routing" do

    it "routes to #index" do
      get("/luxe_registries").should route_to("luxe_registries#index")
    end

    it "routes to #new" do
      get("/luxe_registries/new").should route_to("luxe_registries#new")
    end

    it "routes to #show" do
      get("/luxe_registries/1").should route_to("luxe_registries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/luxe_registries/1/edit").should route_to("luxe_registries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/luxe_registries").should route_to("luxe_registries#create")
    end

    it "routes to #update" do
      put("/luxe_registries/1").should route_to("luxe_registries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/luxe_registries/1").should route_to("luxe_registries#destroy", :id => "1")
    end

  end
end
