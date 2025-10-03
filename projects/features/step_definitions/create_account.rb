
#########
# GIVEN
#########

Given(/^I navigate to the Create Account page$/) do
  @login_page = LoginPage.new
  @login_page.load_login_page
  @create_account_page = CreateAccountPage.new
  @create_account_page.register_your_account_button
end

#########
# WHEN
#########

When(/^I enter the required account details$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.enter_new_account_credentials
end

When(/^I enter the account details without a first name$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'first_name', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details without a last name$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'last_name', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details without a DOB$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'dob', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details with an invalid DOB$/) do
  fill_in 'dob', with: '01-01-1990'
end

When(/^I enter the account details without a street address$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'street', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details without a postal code$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'postal_code', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details without a city$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'city', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details without a state$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'state', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details without a country$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.click_register_button
end

When(/^I enter the account details without a phone number$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'phone', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details with an invalid phone number format$/) do
  fill_in 'phone', with: '555-555-5555'
end

When(/^I enter the account details without an email address$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'email', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details with a password less than 6 characters$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'password', with: 'P@ss1'
  @create_account_page.click_register_button
end

When(/^I enter the account details without a password$/) do
  @create_account_page = CreateAccountPage.new
  fill_in 'password', with: ''
  @create_account_page.click_register_button
end

When(/^I enter the account details with a weak password$/) do
  fill_in 'password', with: '1'
end

When(/^I enter the account details with a moderate password$/) do
  fill_in 'password', with: 'F1'
end

When(/^I enter the account details with a strong password$/) do
  fill_in 'password', with: 'F1@'
end

When(/^I enter the account details with a very strong password$/) do
  fill_in 'password', with: 'F1@f'
end

When(/^I enter the account details with an excellent password$/) do
  fill_in 'password', with: 'F1@fGe!b'
end

#########
# THEN
#########

Then(/^I should be redirected back to the login page$/) do
  expect(current_url).to eq("#{project['base_url']}/auth/register")
end

Then(/^I should see the first name error message "(.*?)"$/) do |expected_firstname_text|
  actual_firstname_text = find('div[data-test="first-name-error"]').text
  expect(actual_firstname_text).to eq(expected_firstname_text)
end

Then(/^I should see the last name error message "(.*?)"$/) do |expected_lastname_text|
  actual_lastname_text = find('div[data-test="last-name-error"]').text
  expect(actual_lastname_text).to eq(expected_lastname_text)
end

Then(/^I should see the DOB error message "(.*?)"$/) do |expected_dob_text|
  actual_dob_text = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[3]/div/div[2]').text
  expect(actual_dob_text).to eq(expected_dob_text)
end

Then(/^I should see the invalid DOB error message "(.*?)"$/) do |expected_invalid_dob_text|
  actual_invalid_dob_text = find('div[data-test="dob-error"]').text
  expect(actual_invalid_dob_text).to eq(expected_invalid_dob_text)
end

Then(/^I should see the street address error message "(.*?)"$/) do |expected_street_text|
  actual_street_text = find('div[data-test="street-error"]').text
  expect(actual_street_text).to eq(expected_street_text)
end

Then(/^I should see the postal code error message "(.*?)"$/) do |expected_postalcode_text|
  actual_postalcode_text = find('div[data-test="postal_code-error"]').text
  expect(actual_postalcode_text).to eq(expected_postalcode_text)
end

Then(/^I should see the city error message "(.*?)"$/) do |expected_city_text|
  actual_city_text = find('div[data-test="city-error"]').text
  expect(actual_city_text).to eq(expected_city_text)
end

Then(/^I should see the state error message "(.*?)"$/) do |expected_state_text|
  actual_state_text = find('div[data-test="state-error"]').text
  expect(actual_state_text).to eq(expected_state_text)
end

Then(/^I should see the country error message "(.*?)"$/) do |expected_country_text|
  actual_country_text = find('div[data-test="country-error"]').text
  expect(actual_country_text).to eq(expected_country_text)
end

Then(/^I should see the phone number error message "(.*?)"$/) do |expected_phone_text|
  actual_phone_text = find('div[data-test="phone-error"]').text
  expect(actual_phone_text).to eq(expected_phone_text)
end

Then(/^I should see the invalid phone number error message "(.*?)"$/) do |expected_invalid_phone_text|
  actual_invalid_phone_text = find('div[data-test="phone-error"]').text
  expect(actual_invalid_phone_text).to eq(expected_invalid_phone_text)
end

Then(/^I should see the email address error message "(.*?)"$/) do |expected_email_text|
  actual_email_text = find('div[data-test="email-error"]').text
  expect(actual_email_text).to eq(expected_email_text)
end

Then(/^I should see the password error message "(.*?)"$/) do |expected_password_text|
  actual_password_text = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[3]/div[1]').text
  expect(actual_password_text).to eq(expected_password_text)
end

Then(/^I should see the minimal password error message "(.*?)"$/) do |expected_password_text|
  actual_password_text = find('div[data-test="password-error"]').text
  expect(actual_password_text).to eq(expected_password_text)
end

Then(/^I should see the invalid password error message "(.*?)"$/) do |expected_invalid_password_text|
  actual_invalid_password_text = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[3]/div[3]').text
  expect(actual_invalid_password_text).to eq(expected_invalid_password_text)
end

Then(/^I should see at least one number requirement has passed$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.one_number_requirement_passed
end

Then(/^I should see the weak password bar graph of "width: 20%;"$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.weak_label
  element = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[2]/div[2]/div')
  style_attribute = element[:style]
  expect(style_attribute).to eq('width: 20%;')
end

Then(/^I should see the moderate password bar graph of "width: 40%;"$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.moderate_label
  element = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[2]/div[2]/div')
  style_attribute = element[:style]
  expect(style_attribute).to eq('width: 40%;')
end

Then(/^I should see at least one special symbol requirement has passed$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.one_special_symbol_requirement_passed
end

Then(/^I should see the strong password bar graph of "width: 60%;"$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.strong_label
  element = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[2]/div[2]/div')
  style_attribute = element[:style]
  expect(style_attribute).to eq('width: 60%;')
end

Then(/^I should see both uppercase and lowercase letters requirement have passed$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.contain_uppercase_and_lowercase_letters
end

Then(/^I should see the very strong password bar graph of "width: 80%;"$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.very_strong_label
  element = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[2]/div[2]/div')
  style_attribute = element[:style]
  expect(style_attribute).to eq('width: 80%;')
end

Then(/^I should see at least 8 characters long requirement have passed$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.least_eight_characters_requirement_passed
end

Then(/^I should see the excellent password bar graph of "width: 100%;"$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.excellent_label
  element = find(:xpath, '/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[2]/div[2]/div')
  style_attribute = element[:style]
  expect(style_attribute).to eq('width: 100%;')
end