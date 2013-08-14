require 'spec_helper'

describe "luxe_registries/new" do
  before(:each) do
    assign(:luxe_registry, stub_model(LuxeRegistry,
      :event => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new luxe_registry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", luxe_registries_path, "post" do
      assert_select "input#luxe_registry_event[name=?]", "luxe_registry[event]"
      assert_select "input#luxe_registry_first_name[name=?]", "luxe_registry[first_name]"
      assert_select "input#luxe_registry_last_name[name=?]", "luxe_registry[last_name]"
      assert_select "input#luxe_registry_phone[name=?]", "luxe_registry[phone]"
    end
  end
end
