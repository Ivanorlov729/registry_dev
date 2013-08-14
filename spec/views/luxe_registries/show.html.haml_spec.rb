require 'spec_helper'

describe "luxe_registries/show" do
  before(:each) do
    @luxe_registry = assign(:luxe_registry, stub_model(LuxeRegistry,
      :event => nil,
      :first_name => "First Name",
      :last_name => "Last Name",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Phone/)
  end
end
