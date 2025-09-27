class LoginPage
  include Capybara::DSL
  include RSpec::Matchers

  def invalid_credentials_message
    expect(page).to have_css('div[data-test="login-error"]', text: 'Invalid email or password')
  end

  def email_error_message
    expect(page).to have_css('div[id="email-error"]', text: 'Email is required')
  end

  def password_error_message
    expect(page).to have_css('div[id="password-error"]', text: 'Password is required')
  end
end