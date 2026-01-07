This project uses Ruby, Bundler, Cucumber, Capybara, and RSpec for behavior-driven tests with a page-object style.

Prerequisites:
- Ruby (3.0+ recommended)
- Bundler

Install dependencies:
```bash
# Install Bundler if you don’t have it already
gem install bundler

# Install all project dependencies from the Gemfile
bundle install
```
Bundler will install Cucumber, Capybara, RSpec, and any other gems defined in the Gemfile.

Running Tests:

You can run your feature tests using Cucumber:
```bash
# Runs all feature tests
bundle exec cucumber features/

# Runs a specific feature file
bundle exec cucumber features/<name>.feature

# Runs a specific scenario at a given line number
bundle exec cucumber features/<name>.feature:<line>
```
Using bundle exec ensures the tests use the same gem versions defined for the project.


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