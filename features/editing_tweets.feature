Feature: Editing tweets

    As the administrator
    In order to amend tweets
    I want to be able to select and edit tweets

    Background:
      Given I have the following content:
        | content               | tweet_time          | repeat |
        | This is a dummy tweet | 2011-01-31 01:02:03 | true  |
        | This is another tweet | 2011-03-01 11:22:33 | false   |

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
      Then I should be on the "Show Tweet" page
      And I should see a "Tweet was successfully updated." message

    @javascript
    Scenario: Editing tweet times
      When I go to the "List Tweets" page
      When I click to edit the first tweet
      And I edit the tweet time to "2010-05-04 03:02:01"
      When I press "Update Tweet"
      Then the tweet should be saved
      And the tweet time should be updated to "2010-05-04 03:02:01"
      And I should see a "Tweet was successfully updated." message

    @javascript
    Scenario: Turning tweet repeat status on
      When I go to the "List Tweets" page
      And I click to edit the first tweet
      Then I should be on the "Edit Tweet" page
      When I toggle the 'repeat' checkbox
      And I press "Update Tweet"
      Then the tweet should be saved
      And the tweet repeat status should be "on"
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

