Feature: Login
  Verify login features against valid and invalid credentials.

Background: Proceed to the Login page
  Given I navigate to the login page

  Scenario: Able to login with a valid account
    When I enter a valid account
    Then I should see the welcome message

  Scenario: Unable to login with an invalid UserID
    When I enter an invalid userid
    Then I should see the invalid userid alert

  Scenario: Unable to login with an invalid password
    When I enter an invalid password
    Then I should see the invalid password alert

# Forgot UserID
@wip
  Scenario: Able to submit a Forgot UserID request
    When I enter a valid forgot email address
    Then I should see a reset UserID confirmation message

  Scenario: Unable to submit with an invalid Forgot UserID entry
    When I enter an invalid forgot userid entry
    Then I should see the invalid userid alert

  Scenario: Unable to submit with a blank Forgot UserID field
    When I submit with a blank Forgot UserID field
    Then I should see an alert for a blank Forgot UserID field

# Forgot Password
@wip
  Scenario: Able to submit a Forgot Password request
    When I enter a valid forgot password
    Then I should see a reset Password confirmation message

  Scenario: Unable to submit with an invalid Forgot Password entry
    When I enter an invalid forgot password
    Then I should see the invalid password alert

  Scenario: Unable to submit with a blank Forgot Password field
    When I submit with a blank Forgot Password field
    Then I should see an alert for a blank Forgot Password field
