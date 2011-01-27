require 'spec_helper'

describe "tweets/show.html.erb" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :content => "Content",
      :repeat => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Content/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
