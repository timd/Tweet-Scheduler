Then /^I should see a list of tweets$/ do
  tweet_count = Tweet.count
  page.should have_xpath("//td[@id='tweet_content']", :count => tweet_count)
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