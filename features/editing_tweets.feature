Feature: Editing tweets

    As the administrator
    In order to amend tweets
    I want to be able to select and edit tweets

    Background:
      Given I have the following content:
        | content               | tweet_time          | repeat |
        | This is a dummy tweet | 2010-01-31 00:00:00 | false  |
        | This is another tweet | 2010-01-33 00:00:00 | true   |

    @javascript
    Scenario: Listing the tweets
      When I go to the "List Tweets" page
      Then I should see a list of tweets

    @javascript
    Scenario: Selecting a tweet to edit
      When I go to the "List Tweets" page
      And I click to edit the first tweet
      Then I should be on the "Edit Tweet" page

    @javascript
    Scenario: Editing tweet content
      When I go to the "List Tweets" page
      And I click to edit the first tweet
      Then I should be on the "Edit Tweet" page
      When I edit the content to read "This is some amended content"
      When I press "Update Tweet"
      Then the tweet should be saved
      And the content should be updated to "This is some amended content"
      And I should see the "Show tweet" page
      And I should see a "Successfully updated" message

    @javascript
    Scenario: Editing tweet times
      Given I am on the List Tweets page
      And I have the following content
        | content               | tweet_time          | repeat |
        | This is a dummy tweet | 2010-01-31 00:00:00 | false  |
        | This is another tweet | 2010-01-33 00:00:00 | true   |
      When I click to edit the first tweet
      Then I should see the content "This is a dummy tweet"
      When I edit the tweet time to "2010-03-01 00:00:00"
      And I click the 'Save tweet' button
      Then the tweet should be saved
      And the tweet time should be updated to "2010-03-01 00:00:00"
      And I should see the "Show tweet" page
      And I should see a "Successfully updated" message

    @javascript
    Scenario: Turning tweet repeat status off
      Given I am on the List Tweets page
      And I have the following content
        | content               | tweet_time          | repeat |
        | This is a dummy tweet | 2010-01-31 00:00:00 | false  |
        | This is another tweet | 2010-01-33 00:00:00 | true   |
      When I click to edit the first tweet
      Then I should see the content "This is a dummy tweet"
      When I toggle the 'repeat' checkbox
      And I click the 'Save tweet' button
      Then the tweet should be saved
      And the tweet repeat status should be off
      And I should see the "Show tweet" page
      And I should see a "Successfully updated" message

    @javascript
    Scenario: Turning tweet repeat status on
      Given I am on the List Tweets page
      And I have the following content
        | content               | tweet_time          | repeat |
        | This is a dummy tweet | 2010-01-31 00:00:00 | true   |
        | This is another tweet | 2010-01-33 00:00:00 | false  |
      When I click to edit the first tweet
      Then I should see the content "This is a dummy tweet"
      When I toggle the 'repeat' checkbox
      And I click the 'Save tweet' button
      Then the tweet should be saved
      And the tweet repeat status should be on
      And I should see the "Show tweet" page
      And I should see a "Successfully updated" message

