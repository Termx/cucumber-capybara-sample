Feature: Account Settings
  Verify setting functions for user accounts.

Background: Proceed to the Account Settings page
  Given I navigate to the account settings page

  Scenario: The UserID displays correctly at the top-right corner
    Then I should verify the UserID matches the current signin account

  Scenario: The detail info for the account displays correctly
    Then I should verify the info matches the current signin account

## Redeem Code

  Scenario: An invalid Redeem Code value will throw an error message
    When I submit an invalid Redeem Code value
    Then I should receive an error regarding the invalid Redeem Code

  Scenario: Able to successfully apply a Redeem Code to the account
    When I submit a valid Redeem Code
    Then I should see the Redeem Code discount apply to the account

## Edit Account Info

  Scenario: Able to change the registered First and Last Name of the account
    When I enter a new First and Last Name in the name fields
    Then I should see the new name display

  Scenario: A blank First and Last Name field will display an error
    When I submit a new First and Last Name with a blank field
    Then I should see an error regarding the blank name fields

  Scenario: Clicking cancel will not save the First and Last Name progress
    When I enter a new Fist and Last Name in the name fields
    Then I click the cancel button and the name process is not saved
