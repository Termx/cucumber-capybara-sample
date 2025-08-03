require 'capybara'
require 'capybara/cucumber'
require 'require_all'
require 'rspec'
require 'rubocop'
require 'selenium-webdriver'

### driver setup ###
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--window-size=1920,1440')
  options.add_argument('--ignore-certificate-errors')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

driver = case ENV['BROWSER']
when 'chrome'
  :chrome
when 'firefox'
  :firefox
else
  :chrome
end

Capybara.default_driver         = driver
Capybara.javascript_driver      = :selenium
Capybara.run_server             = false
Capybara.default_selector       = :css
Capybara.ignore_hidden_elements = false
Capybara.default_max_wait_time  = 10


Before do |scenario|
  @data_bag = {}
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  Capybara.current_session.driver.browser.manage.window.resize_to(1920, 1080)
end

After do |scenario|
  if scenario.failed?
    add_screenshot
    Capybara.current_session.driver.browser.manage.delete_all_cookies
  end
end

def add_screeshot
  file_name = 'screenshot.png'
  file_path = "report/#{file_name}"
  page.driver.browser.save_screenshot(file_path)
  image = open(file_path, 'rb', &:read)
  encoded_image = Base64.encode64(image)
  embed(encoded_image, 'image/png;base64', 'SCREENSHOT')
end

def load_env_config()
  config_path  = FileUtils.pwd + '/config.yml'
  config       = YAML::load(File.read(config_path))
  default_env  = ENV['QA_ENV'] || 'qa'
  return config[default_env]
end

def subdomain
  warn "[DEPRECATION] `subdomain` is deprecated.  Please use `domain` instead."
  return domain
end

def domain
  load_env_config['domain']
end

def localized_domain
  ENV["locale"] ? File.join(domain, "/", ENV["locale"]) : domain
end

def locale
  ENV["locale"] || ""
end

def wait_multiplier
  load_env_config['wait_multiplier']
end
