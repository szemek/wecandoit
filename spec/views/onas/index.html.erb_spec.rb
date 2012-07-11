require 'spec_helper'

describe "onas/index" do
  before(:each) do
    assign(:onas, [
      stub_model(Ona,
        :name => "Name",
        :info => "Info"
      ),
      stub_model(Ona,
        :name => "Name",
        :info => "Info"
      )
    ])
  end

  it "renders a list of onas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Info".to_s, :count => 2
  end
end
