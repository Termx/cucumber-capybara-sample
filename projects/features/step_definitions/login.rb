
#########
# GIVEN
#########

Given(/^I navigate to the login page$/) do
  @login_page = LoginPage.new
  @login_page.load_login_page
end

#########
# WHEN
#########

When(/^I enter valid credentials$/) do
  fill_in 'email', with: project['user_email']
  fill_in 'password', with: project['user_pw']
  click_button 'Login'
end

When(/^I enter invalid credentials$/) do
  fill_in 'email', with: project['invalid_email']
  fill_in 'password', with: project['invalid_pw']
  click_button 'Login'
end

When(/^I enter credentials without an email$/) do
  fill_in 'email', with: ''
  fill_in 'password', with: project['user_pw']
  click_button 'Login'
end

When(/^I enter credentials without a password$/) do
  fill_in 'email', with: project['user_email']
  fill_in 'password', with: ''
  click_button 'Login'
end

When(/^I request a password reset$/) do
  click_link 'Forgot your Password?'
  fill_in 'email', with: project['user_email']
  click_button 'Set New Password'
end

When(/^I request a password reset with an invalid email$/) do
  click_link 'Forgot your Password?'
  fill_in 'email', with: project['invalid_email']
  click_button 'Set New Password'
end

When(/^I request a password reset without an email address$/) do
  click_link 'Forgot your Password?'
  fill_in 'email', with: ''
  click_button 'Set New Password'
end

#########
# THEN
#########

Then(/^I should be redirected to the account page$/) do
  expect(page).to have_css('h1[data-test="page-title"]', text: 'My account')
  expect(page).to have_css("p", text: 'Here you can manage your profile, favorites and orders.')
end

Then(/^I should see an error message$/) do
  @login_page = LoginPage.new
  @login_page.invalid_credentials_message
end

Then(/^I should see the email error message$/) do
  @login_page = LoginPage.new
  @login_page.email_error_message
end

Then(/^I should see the password error message$/) do
  @login_page = LoginPage.new
  @login_page.password_error_message
end

Then(/^I should see a password reset confirmation message$/) do
  @login_page = LoginPage.new
  @login_page.password_reset_confirmation_message
end

Then(/^I should see password reset field display an invalid error message$/) do
  @login_page = LoginPage.new
  @login_page.password_reset_invalid_email_password_reset_message
end

Then(/^I should see password reset field display an error message$/) do
  expect(page).to have_css('div[id="email-error"]', text: 'Email is required')
end