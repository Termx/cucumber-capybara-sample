Basic template using Selenium webdriver with Cucumber BDD, Capybara, & RSpec with Page Object Model.

Prerequisites:
- Ruby 3.4.6
- RSPec
- Cucumber

Install dependencies:
``` Ruby
gem install bundler
```

Run bundle to install dependencies:
``` Ruby
bundle install
```

Run all tests from root folder:
``` Ruby
cucumber features/
```

Run a specific feature file:
``` Ruby
cucumber features/xxxx.feature
```

Run a specific scenario by line number:
``` Ruby
cucumber features/xxxx.feature:xx (xx is line number)
```