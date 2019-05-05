
#########
# GIVEN
#########

Given(/^I navigate to the login page$/) do
  visit domain
end

#########
# WHEN
#########

When(/^I enter a valid account$/) do
  fill_in 'userid', with: project_website['user_id']
  fill_in 'password', with: project_website['user_password']
  click_button 'Login'
end

When(/^I enter an invalid userid$/) do
  fill_in 'userid', with: project_website['invalid_userid']
  fill_in 'password', with: project_website['user_password']
  click_button 'Login'
end

When(/^I enter an invalid password$/) do
  fill_in 'username', with: project_website['user_id']
  fill_in 'password', with: project_website['invalid_password']
  click_button 'Login'
end

# Forgot UserID

When(/^I enter a valid forgot email address$/) do
  # placeholder
end

When(/^I enter an invalid forgot userid entry$/) do
  click_link 'Forgot UserID'
  fill_in 'userid', with: project_website['invalid_userid']
  click_button 'Submit'
end

When(/^I submit with a blank Forgot UserID field$/) do
  fill_in 'userid', with: ''
  click_button 'Submit'
end

#########
# THEN
#########

Then(/^I should see the welcome message$/) do
  expect(page).to have_css('div.welcome', text: project_website['welcome_message'])
end

Then(/^I should see the invalid userid alert$/) do
  expect(page).to have_css('#userid', text: project_website['invalid_userid_alert'])
end

Then(/^I should see the invalid password alert$/) do
  expect(page).to have_css('#password', text: project_website['invalid_pw_alert'])
end

Then(/^I should see login error message$/) do
  expect(page).to have_css('div.alert', text: 'Invalid user name or password')
end

# Forgot UserID

Then(/^I should see a reset UserID confirmation message$/) do
  # placeholder
end

Then(/^I should see an alert for a blank Forgot UserID field$/) do
  expect(page).to have_css('div.alert', text: project_website['blank_userid_alert'])
end

# Forgot Password

Then(/^I should see a reset Password confirmation message$/) do
  # placeholder
end

Then(/^I should see an alert for a blank Forgot Password field$/) do
  expect(page).to have_css('div.alert', text: project_website['blank_password_alert'])
end
