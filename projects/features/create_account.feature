Feature: Create Account
    As a user
    I want to create an account
    So that I can access member features while shopping
    
    Background:
        Given I navigate to the Create Account page
    
    Scenario: Able to create a new account
        When I enter the required account details
        Then I should be redirected back to the login page