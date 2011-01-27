require 'spec_helper'

describe "tweets/edit.html.erb" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :new_record? => false,
      :content => "MyString",
      :repeat => false
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tweet_path(@tweet), :method => "post" do
      assert_select "input#tweet_content", :name => "tweet[content]"
      assert_select "input#tweet_repeat", :name => "tweet[repeat]"
    end
  end
end
