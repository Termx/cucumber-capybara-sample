class LoginPage
  include Capybara::DSL
  include RSpec::Matchers

  def load_login_page
    visit domain
    find('a[data-test="nav-sign-in"]', wait: 3).click
  end

  def invalid_credentials_message
    expect(page).to have_css('div[data-test="login-error"]', text: 'Invalid email or password')
  end

  def email_error_message
    expect(page).to have_css('div[id="email-error"]', text: 'Email is required')
  end

  def password_error_message
    expect(page).to have_css('div[id="password-error"]', text: 'Password is required')
  end

  # Password Reset

  def password_reset_confirmation_message
    expect(page).to have_css('div[role="alert"]', text: 'page.forgot-password.confirm')
  end

  def password_reset_invalid_email_password_reset_message
    expect(page).to have_css('div[role="alert"]', text: 'The selected email is invalid.')
  end
end