
#########
# GIVEN
#########

Given(/^I navigate to the Create Account page$/) do
  @login_page = LoginPage.new
  @login_page.load_login_page
  find('a[data-test="register-link"]', wait: 3).click
end

#########
# WHEN
#########

When(/^I enter the required account details$/) do
  @create_account_page = CreateAccountPage.new
  @create_account_page.enter_new_account_credentials
end

#########
# THEN
#########

Then(/^I should be redirected back to the login page$/) do
  expect(current_url).to eq('https://practicesoftwaretesting.com/auth/register')
end
