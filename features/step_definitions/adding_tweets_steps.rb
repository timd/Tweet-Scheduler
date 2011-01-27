Then /^I should see a form to enter the tweet details$/ do
  page.should have_css("form[action='#{ tweets_path }']")
end

Then /^I should see a textarea to enter the tweet content$/ do
  page.should have_css("input[name='commit']")
end

Then /^I should see a field to enter the tweet time$/ do
  page.should have_css("label")
end

Then /^I should see a checkbox for repeat$/ do
  page.should have_css("input[name='tweet[repeat]']")
end

Then /^I should see a button to save the tweet$/ do
  page.should have_css("input[type=submit][value='Create Tweet']")
end

When /^I fill in the tweet details as "([^"]*)"$/ do |arg1|
  fill_in("tweet_content", :with => "This is some tweet content")
end

Given /^I have the following content:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attrs|
    # Create the mock game_type objects using FactoryGirl, and values from the table in the feature
    Factory.create( :tweet, attrs )
  end
  Tweet.count.should eql( table.hashes.size )
end

Then /^the following tweets should exist:$/ do |table|
    table.rows.each do |row|
        content, tweet_time, repeat = row
      # Create the mock game_type objects using FactoryGirl, and values from the table in the feature
      tweet = Tweet.find_by_content(content)
      tweet.should_not be_nil
    end
end

Then /^I should see the following tweets:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.rows.each do |row|
      content, tweet_time, repeat = row
      page.should have_xpath("//td", :text => content)
  end
end