require 'spec_helper'

describe "tweets/new.html.erb" do
  before(:each) do
    assign(:tweet, stub_model(Tweet,
      :content => "MyString",
      :repeat => false
    ).as_new_record)
  end

  it "renders new tweet form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path, :method => "post" do
      assert_select "input#tweet_content", :name => "tweet[content]"
      assert_select "input#tweet_repeat", :name => "tweet[repeat]"
    end
  end
end
