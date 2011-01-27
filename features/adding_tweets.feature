Feature: Adding tweets

    As the administrator
    In order to create tweets
    I want to be able to input tweet content
    
    @adding
    Scenario: Viewing the create tweet page
        Given I am on the New Tweets page
        Then I should see a form to enter the tweet details
        And I should see a textarea to enter the tweet content
        And I should see a field to enter the tweet time
        And I should see a checkbox for repeat
        And I should see a button to save the tweet

    Scenario: Creating the tweet
        Given I am on the New Tweets page
        And I have the following content:
            | content               | tweet_time          | repeat |
            | This is a dummy tweet | 2010-01-31 00:00:00 | false  |
            | This is another tweet | 2010-01-33 00:00:00 | true   |
        When I fill in the tweet details as "This is a test tweet"
        When I press "Create Tweet"
        Then the following tweets should exist:
            | content               | tweet_time          | repeat |
            | This is a dummy tweet | 2010-01-31 00:00:00 | false  |
            | This is another tweet | 2010-01-33 00:00:00 | true   |
        Then I should be on the List Tweets page
        And I should see the following tweets:
            | content               | tweet_time          | repeat |
            | This is a dummy tweet | 2010-01-31 00:00:00 | false  |
            | This is another tweet | 2010-01-33 00:00:00 | true   |
        
	@wip
	Scenario: Adding overly-long tweet content
	    Given new content that is longer than 140 characters
        When I try to save the content
        And it should prevent the content from being saved

    @wip
    Scenario: Adding overly-short tweet content
    	Given new content that is less than XXX characters
    	When I try to save the content
    	And it should warn me that the content is short