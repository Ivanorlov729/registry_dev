require 'spec_helper'

describe "luxe_registries/edit" do
  before(:each) do
    @luxe_registry = assign(:luxe_registry, stub_model(LuxeRegistry,
      :event => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit luxe_registry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", luxe_registry_path(@luxe_registry), "post" do
      assert_select "input#luxe_registry_event[name=?]", "luxe_registry[event]"
      assert_select "input#luxe_registry_first_name[name=?]", "luxe_registry[first_name]"
      assert_select "input#luxe_registry_last_name[name=?]", "luxe_registry[last_name]"
      assert_select "input#luxe_registry_phone[name=?]", "luxe_registry[phone]"
    end
  end
end
