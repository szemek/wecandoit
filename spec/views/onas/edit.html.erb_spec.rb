require 'spec_helper'

describe "onas/edit" do
  before(:each) do
    @ona = assign(:ona, stub_model(Ona,
      :name => "MyString",
      :info => "MyString"
    ))
  end

  it "renders the edit ona form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => onas_path(@ona), :method => "post" do
      assert_select "input#ona_name", :name => "ona[name]"
      assert_select "input#ona_info", :name => "ona[info]"
    end
  end
end
