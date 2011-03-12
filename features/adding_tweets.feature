Feature: Adding tweets

    As the administrator
    In order to create tweets
    I want to be able to input tweet content
    
    @javascript
    Scenario: Viewing the create tweet page
        Given I am on the New Tweets page
        Then I should see a form to enter the tweet details
        And I should see a textarea to enter the tweet content
        And I should see a field to enter the tweet time
        And I should see a checkbox for repeat
        And I should see a button to save the tweet

    @javascript
    Scenario: Creating the tweet
        Given I am on the New Tweets page
        And I have the following content:
            | content               | tweet_time          | repeat |
            | This is a dummy tweet | 2011-10-31 00:00:00 | false  |
            | This is another tweet | 2011-10-30 00:00:00 | true   |
        When I fill in the tweet details as "This is a test tweet"
        When I press "Create Tweet"
        Then the following tweets should exist:
            | content               | tweet_time          | repeat |
            | This is a dummy tweet | 2011-10-31 00:00:00 | false  |
            | This is another tweet | 2011-10-30 00:00:00 | true   |
        And I should be on the "List Tweets" page
        
	@javascript
	Scenario: Adding overly-long tweet content
	  Given I am on the New Tweets page
	  When I create a tweet with content that has 141 characters
	  And I press "Create Tweet"
	  Then the tweet should not be saved
	  And I should see an error that says "can't be more than 140 characters long!"

  @javascript
  Scenario: Adding overly-short tweet content
	  Given I am on the New Tweets page
	  When I create a tweet with content that has 0 characters
	  And I press "Create Tweet"
	  Then the tweet should not be saved
	  And I should see an error that says "Content should be at least one character"