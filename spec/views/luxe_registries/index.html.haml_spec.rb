require 'spec_helper'

describe "luxe_registries/index" do
  before(:each) do
    assign(:luxe_registries, [
      stub_model(LuxeRegistry,
        :event => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone => "Phone"
      ),
      stub_model(LuxeRegistry,
        :event => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of luxe_registries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
