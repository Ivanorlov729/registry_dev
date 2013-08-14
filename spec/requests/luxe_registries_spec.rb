require 'spec_helper'

describe "LuxeRegistries" do
  describe "GET /luxe_registries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get luxe_registries_path
      response.status.should be(200)
    end
  end
end
