class CreateAccountPage
  include Capybara::DSL
  include RSpec::Matchers

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

    click_button 'Register'
  end
end