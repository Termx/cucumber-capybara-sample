Feature: Create Account
  Verify features against valid and invalid account creation steps.

Background: Proceed to the Create Account page
  Given I navigate to the create account page

@wip
  Scenario: Able to create a new account
    When I enter a valid UserID and Password
    Then I should see the new account confirmation message
    And I should receive a confirmation e-mail

  Scenario: An error message will display if the input fields are left blank
    When I submit and leave all input fields blank
    Then I should an alert regarding the input fields left blank

  Scenario: All input fields remain filled after a failed submission
    When I enter an invalid UserID and Password
    Then the input fields should remain filled after the failed submission

  Scenario: Unable to submit with a UserID with more than 10 characters
    When I enter a UserID with more than 10 characters
    Then I should see an error message regarding the UserID characters

  Scenario: Unable to submit with a Password with more than 15 characters
    When I enter a Password with more than 15 characters
    Then I should see an error message regarding the Password characters
