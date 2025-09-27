require File.expand_path(File.dirname(__FILE__) + '/../../support/env.rb')
require 'yaml'

# method is the name to call strings from the config.yml
def project
  config = load_env_config
end

def scroll_to_bottom
  page.execute_script "window.scrollBy(0,10000)"
end

def logout_admin
  visit domain
  click_link "Logout"
end

module Capybara
  class Session

    def check_data_table_row(column_name, text)
      exists = false
      all("td.yui-dt-col-#{column_name} div.yui-dt-liner").each do |cell|
        ( exists = true and break ) if cell.text == text
      end
      exists
    end

    def click_dashboard_link(text)
      find("#app-content").click_link(text)
    end

    def click_main_header_link(text)
      find("#main-header").click_link(text)
    end

  end
end
