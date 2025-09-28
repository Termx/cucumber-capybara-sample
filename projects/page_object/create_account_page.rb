class CreateAccountPage
  include Capybara::DSL
  include RSpec::Matchers

  def register_your_account_button
    find('a[data-test="register-link"]', wait: 3).click
  end

  def click_register_button
    click_button 'Register'
  end

  def enter_new_account_credentials
    expect(page).to have_css('label[for="first_name"]', text: 'First name')
    fill_in 'first_name', with: 'Bob'

    expect(page).to have_css('label[for="last_name"]', text: 'Last name')
    fill_in 'last_name', with: 'Smith'

    expect(page).to have_css('label[for="dob"]', text: 'Date of Birth *')
    fill_in 'dob', with: '1990-01-01'

    expect(page).to have_css('label[for="street"]', text: 'Street')
    fill_in 'street', with: '2500 E Arizona Biltmore Cir'

    expect(page).to have_css('label[for="postal_code"]', text: 'Postal code')
    fill_in 'postal_code', with: '85016'

    expect(page).to have_css('label[for="city"]', text: 'City')
    fill_in 'city', with: 'Phoenix'

    expect(page).to have_css('label[for="state"]', text: 'State')
    fill_in 'state', with: 'AZ'

    expect(page).to have_css('label[for="country"]', text: 'Country')
    select('United States of America (the)', from: 'country')

    expect(page).to have_css('label[for="phone"]', text: 'Phone')
    fill_in 'phone', with: '5555555555'

    expect(page).to have_css('label[for="email"]', text: 'Email address')
    fill_in 'email', with: 'bob.smith532@google.com'

    expect(page).to have_css('label[for="password"]', text: 'Password')
    fill_in 'password', with: '%u@_=Ee^~Su2]Ty'

    click_register_button
  end

  # Password Labels

  def weak_label
    within('div.strength-labels') do
      expect(page).to have_css('span.active', text: 'Weak')
    end
  end

  def moderate_label
    within('div.strength-labels') do
      expect(page).to have_css('span.active', text: 'Moderate')
    end
  end

  def strong_label
    within('div.strength-labels') do
      expect(page).to have_css('span.active', text: 'Strong')
    end
  end

  def very_strong_label
    within('div.strength-labels') do
      expect(page).to have_css('span.active', text: 'Very Strong')
    end
  end

  def excellent_label
    within('div.strength-labels') do
      expect(page).to have_css('span.active', text: 'Excellent')
    end
  end

  # Password Requirements

  def one_number_requirement_passed
    expect(page).to have_xpath('/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[1]/ul/ul/li[3]', text: 'Include at least one number')
  end

  def one_special_symbol_requirement_passed
    expect(page).to have_xpath('/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[1]/ul/ul/li[4]', text: 'Have at least one special symbol (e.g., @, #, $, etc.)')
  end

  def contain_uppercase_and_lowercase_letters
    expect(page).to have_xpath('/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[1]/ul/ul/li[2]', text: 'Contain both uppercase and lowercase letters')
  end

  def least_eight_characters_requirement_passed
    expect(page).to have_xpath('/html/body/app-root/div/app-register/div/div/div/form/div/div[11]/div[1]/ul/ul/li[1]', text: 'Be at least 8 characters long')
  end
end