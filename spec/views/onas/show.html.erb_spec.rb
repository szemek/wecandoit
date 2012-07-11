require 'spec_helper'

describe "onas/show" do
  before(:each) do
    @ona = assign(:ona, stub_model(Ona,
      :name => "Name",
      :info => "Info"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Info/)
  end
end
