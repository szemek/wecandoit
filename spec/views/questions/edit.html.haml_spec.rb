require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questions_path(@question), :method => "post" do
      assert_select "input#question_title", :name => "question[title]"
      assert_select "textarea#question_content", :name => "question[content]"
    end
  end
end
