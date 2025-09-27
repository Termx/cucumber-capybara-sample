Feature: Login
  Verify login features against valid and invalid credentials.

Background: Proceed to the Login page
  Given I navigate to the login page

  Scenario: Successful login with valid credentials
    When I enter valid credentials
    Then I should be redirected to the account page
  
  Scenario: Unsuccessful login with invalid credentials
    When I enter invalid credentials
    Then I should see an error message

  Scenario: Able to see an error message when an email is not provided
    When I enter credentials without an email
    Then I should see the email error message
  
  Scenario: Able to see an error message when a password is not provided
    When I enter credentials without a password
    Then I should see the password error message
