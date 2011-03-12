Then /^I should see a list of tweets$/ do
  @tweet_count = Tweet.count
  page.should have_xpath("//td[@id='tweet_content']", :count => @tweet_count)
end

When /^I click to edit the first tweet$/ do
  
    # Grab the first tweet so it can be passed into the route
    # to enable /tweets/1/edit
    @tweet = @tweets_for_test[0]
    @original_content = @tweet.content
    
    within(:xpath, '//tr[2]') do 
      click_link("edit") 
    end
  
end

When /^I edit the content to read "([^"]*)"$/ do |content|
  @new_content = content
  fill_in("tweet[content]", :with => content)
end

Then /^the tweet should be saved$/ do
  #pending # express the regexp above with the code you wish you had
end

Then /^the content should be updated to "([^"]*)"$/ do |arg1|
  @original_content.should_not eq @new_content
end

Then /^I should see a "([^"]*)" message$/ do |message|
  page.should have_content(message)
end

When /^I edit the tweet time to "([^"]*)"$/ do |time|
  
  # Split the time up
  new_date = time.split(" ")[0]
  new_time = time.split(" ")[1]

  split_date = new_date.split("-")
  split_time = new_time.split(":")
  
  @change_time = Time.mktime(split_date[0], split_date[1], split_date[2], split_time[0], split_time[1])
  
  new_year  = @change_time.strftime("%Y")
  new_month = @change_time.strftime("%B")
  new_day =   @change_time.strftime("%e").lstrip

  new_hour = @change_time.strftime("%H")
  new_min  = @change_time.strftime("%M")
  
  # Change the fields
  select new_year,  :from => "tweet_tweet_time_1i"
  select new_month, :from => "tweet_tweet_time_2i"  
  select new_day,   :from => "tweet_tweet_time_3i"  

  select new_hour, :from => "tweet_tweet_time_4i"
  select new_min,  :from => "tweet_tweet_time_5i"

end

Then /^the tweet time should be updated to "([^"]*)"$/ do |tweet_time|
  
  #@tweet_time = Time.parse(@tweet.tweet_time)
  
  #@tweet_time.should eql @change_time
  
end

When /^I toggle the 'repeat' checkbox$/ do
  @original_repeat_status = @tweet.repeat
  check "tweet_repeat"
end

Then /^the tweet repeat status should be "([^"]*)"$/ do |status|
  #
end

When /^I click to delete the first tweet$/ do
  # Grab the first tweet so it can be passed into the route
  # to enable /tweets/1/edit
  @tweet = @tweets_for_test[0]
  @original_content = @tweet.content
  @tweet_count = Tweet.count
  
  within(:xpath, '//tr[2]') do 
    click_link("destroy") 
  end
end

Then /^the tweet should be deleted$/ do
  Tweet.count.should eql @tweet_count - 1
end

