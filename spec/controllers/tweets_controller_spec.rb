require 'spec_helper'

describe TweetsController do

  def mock_tweet(stubs={})
    (@mock_tweet ||= mock_model(Tweet).as_null_object).tap do |tweet|
      tweet.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all tweets as @tweets" do
      Tweet.stub(:all) { [mock_tweet] }
      get :index
      assigns(:tweets).should eq([mock_tweet])
    end
  end

  describe "GET show" do
    it "assigns the requested tweet as @tweet" do
      Tweet.stub(:find).with("37") { mock_tweet }
      get :show, :id => "37"
      assigns(:tweet).should be(mock_tweet)
    end
  end

  describe "GET new" do
    it "assigns a new tweet as @tweet" do
      Tweet.stub(:new) { mock_tweet }
      get :new
      assigns(:tweet).should be(mock_tweet)
    end
  end

  describe "GET edit" do
    it "assigns the requested tweet as @tweet" do
      Tweet.stub(:find).with("37") { mock_tweet }
      get :edit, :id => "37"
      assigns(:tweet).should be(mock_tweet)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tweet as @tweet" do
        Tweet.stub(:new).with({'these' => 'params'}) { mock_tweet(:save => true) }
        post :create, :tweet => {'these' => 'params'}
        assigns(:tweet).should be(mock_tweet)
      end

      it "redirects to the created tweet" do
        Tweet.stub(:new) { mock_tweet(:save => true) }
        post :create, :tweet => {}
        response.should redirect_to(tweet_url(mock_tweet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tweet as @tweet" do
        Tweet.stub(:new).with({'these' => 'params'}) { mock_tweet(:save => false) }
        post :create, :tweet => {'these' => 'params'}
        assigns(:tweet).should be(mock_tweet)
      end

      it "re-renders the 'new' template" do
        Tweet.stub(:new) { mock_tweet(:save => false) }
        post :create, :tweet => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tweet" do
        Tweet.should_receive(:find).with("37") { mock_tweet }
        mock_tweet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tweet => {'these' => 'params'}
      end

      it "assigns the requested tweet as @tweet" do
        Tweet.stub(:find) { mock_tweet(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:tweet).should be(mock_tweet)
      end

      it "redirects to the tweet" do
        Tweet.stub(:find) { mock_tweet(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(tweet_url(mock_tweet))
      end
    end

    describe "with invalid params" do
      it "assigns the tweet as @tweet" do
        Tweet.stub(:find) { mock_tweet(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:tweet).should be(mock_tweet)
      end

      it "re-renders the 'edit' template" do
        Tweet.stub(:find) { mock_tweet(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tweet" do
      Tweet.should_receive(:find).with("37") { mock_tweet }
      mock_tweet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tweets list" do
      Tweet.stub(:find) { mock_tweet }
      delete :destroy, :id => "1"
      response.should redirect_to(tweets_url)
    end
  end

end
