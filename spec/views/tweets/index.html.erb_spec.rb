require 'spec_helper'

describe "tweets/index.html.erb" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :content => "Content",
        :repeat => false
      ),
      stub_model(Tweet,
        :content => "Content",
        :repeat => false
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
