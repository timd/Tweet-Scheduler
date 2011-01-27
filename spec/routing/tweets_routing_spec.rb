require "spec_helper"

describe TweetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tweets" }.should route_to(:controller => "tweets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tweets/new" }.should route_to(:controller => "tweets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tweets/1" }.should route_to(:controller => "tweets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tweets/1/edit" }.should route_to(:controller => "tweets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tweets" }.should route_to(:controller => "tweets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tweets/1" }.should route_to(:controller => "tweets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tweets/1" }.should route_to(:controller => "tweets", :action => "destroy", :id => "1")
    end

  end
end
