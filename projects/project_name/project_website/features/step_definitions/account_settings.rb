
#########
# GIVEN
#########

Given(/^I navigate to the account settings page$/) do
  step 'I navigate to the login page'
  step 'I enter a valid account'
  click_link 'Account Settings'
end

#########
# WHEN
#########

## Redeem Code

When(/^I submit an invalid Redeem Code value$/) do
  click_link 'Redeem Code'
  fill_in 'redeem', with: '45-----'
  click_button 'Submit'
end

When(/^I submit a valid Redeem Code$/) do
  click_link 'Redeem Code'
  fill_in 'redeem', with: '467TF3FB'
  click_button 'Submit'
end

## Edit Account Info

When(/^I enter a new First and Last Name in the name fields$/) do
  fill_in 'first', with: 'John'
  fill_in 'last', with: 'Doe'
  click_button 'Submit'
end

When(/^I submit a new First and Last Name with a blank field$/) do
  fill_in 'first', with: ''
  fill_in 'last', with: ''
  click_button 'Submit'
end

#########
# THEN
#########

Then(/^I should verify the UserID matches the current signin account$/) do
  expect(page).to have_css('#userid', text: project_website['user_id'])
  expect(page).to have_css('#city', text: 'Irvine')
  expect(page).to have_css('#state', text: 'CA')
end

Then(/^I should verify the info matches the current signin account$/) do
  within('#info') do
    expect(page).to have_field('email', with: project_website['user_email'])
    expect(page).to have_field('first', with: 'John')
    expect(page).to have_field('last', with: 'Doe')
  end
end

## Redeem Code

Then(/^I should receive an error regarding the invalid Redeem Code$/) do
  expect(page).to have_css('div.alert-error', text: project_website['redeem_alert'])
end

Then(/^I should see the Redeem Code discount apply to the account$/) do
  expect(page).to have_css('#discount', text: '-20%')
end

## Edit Account Info

Then(/^I should see the new name display$/) do
  expect(page).to have_css('#first', text: 'John')
  expect(page).to have_css('#last', text: 'Doe')
end

Then(/^I should see an error regarding the blank name fields$/) do
  within('#name') do
    expect(page).to have_css('div.alert', text: project_website['blank_name_alert'])
  end
end
Then(/^I click the cancel button and the name process is not saved$/) do
  expect(page).to have_no_css('#first', text: 'John')
  expect(page).to have_no_css('#last', text: 'Doe')
end
