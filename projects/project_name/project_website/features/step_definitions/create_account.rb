
#########
# GIVEN
#########

Given(/^I navigate to the create account page$/) do
  visit domain
  click_link 'Create Account'
end

########
# WHEN
########

When(/^I enter a valid UserID and Password$/) do
  fill_in 'userid', with: 'JohnSnow72'
  fill_in 'password', with: 'WiNT3RisC0mInG'
  click_button 'Submit'
end

When(/^I submit and leave all input fields blank$/) do
  fill_in 'userid', with: ''
  fill_in 'password', with: ''
  click_button 'Submit'
end

When(/^I enter an invalid UserID and Password$/) do
  fill_in 'userid', with: 'RenéClair'
  fill_in 'password', with: 'a@b@c@example.com'
  click_button 'Submit'
end

When(/^I enter a UserID with more than 10 characters$/) do
  fill_in 'userid', with: 'ade25g63g532sks'
  expect(page).to have_css('userid', count: 15)
  click_button 'Submit'
end

When(/^I enter a Password with more than 15 characters$/) do
  fill_in 'password', with: 'just"not"right@example.com'
  expect(page).to have_css('password', count: 26)
  click_button 'Submit'
end

########
# THEN
########

Then(/^I should see the new account confirmation message$/) do
  # placeholder
end

Then(/^I should an alert regarding the input fields left blank$/) do
  expect(page).to have_content(project_website['input_field_blank_alert'])
end

Then(/^the input fields should remain filled after the failed submission$/) do
  expect(page).to have_content(project_website['invalid_userid_pw_alert'])
  expect(page).to have_field('userid', with: 'RenéClair')
  expect(page).to have_field('password', with: 'a@b@c@example.com')
end

Then(/^I should see an error message regarding the UserID characters/) do
  within('#userid') do
    expect(page).to have_css('div.alert', text: project_website['userid_char_alert'])
  end
end

Then(/^I should see an error message regarding the Password characters$/) do
  within('#password') do
    expect(page).to have_css('div.alert', text: project_website['pw_char_alert'])
  end
end

########
# AND
########

And(/^I should receive a confirmation e-mail$/) do
  # placeholder
end
